@tool
@icon("icon/MultiSpliterItem.svg")
extends Control
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#	https://github.com/CodeNameTwister/Multi-Split-Container
#
#	Multi-Split-Container addon for godot 4
#	author:		"Twister"
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

## Expand if tight by spliter
func show_splited_container() -> void:
	var parent : Node = get_parent()
	if parent.has_method(&"expand_splited_container"):
		parent.call(&"expand_splited_container", self)

func _on_gui_input(input : InputEvent) -> void:
	if input.is_pressed():
		show_splited_container()

func _ready() -> void:
	set_process(false)

	size_flags_horizontal = Control.SIZE_FILL
	size_flags_vertical = Control.SIZE_FILL

	set_deferred(&"anchor_left", 0.0)
	set_deferred(&"anchor_top", 0.0)
	set_deferred(&"anchor_bottom", 1.0)
	set_deferred(&"anchor_right", 1.0)

func _init() -> void:
	name = "SplitContainerItem"

	gui_input.connect(_on_gui_input)

	child_exiting_tree.connect(_on_child_exiting_tree)
	child_entered_tree.connect(_on_child_entered_tree)

func _on_child_entered_tree(n : Node) -> void:
	if !Engine.is_editor_hint():
		if n is Control:
			if !n.gui_input.is_connected(_on_gui_input):
				n.gui_input.connect(_on_gui_input)
	else:
		if n.owner == null:
			n.owner = EditorInterface.get_edited_scene_root()
	for x : Node in n.get_children():
		_on_child_entered_tree(x)

func _disconnect(n : Node) -> void:
	if n is Control:
		if n.gui_input.is_connected(_on_gui_input):
			n.gui_input.disconnect(_on_gui_input)
	for x : Node in n.get_children():
		_on_child_exiting_tree(x)

func _on_child_exiting_tree(n : Node) -> void:
	if !Engine.is_editor_hint():
		_disconnect(n)

	if get_child_count() > 0:
		if get_child(0) != n:
			return

func _enter_tree() -> void:
	if Engine.is_editor_hint():
		if owner == null:
			if get_parent().owner:
				owner = get_parent().owner
			else:
				owner = EditorInterface.get_edited_scene_root()
		if get_child_count() > 0:
			if is_queued_for_deletion():
				cancel_free()
			for x : Node in get_children():
				_on_child_entered_tree(x)
