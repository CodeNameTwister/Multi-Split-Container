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

func _init() -> void:
	size_flags_horizontal = Control.SIZE_FILL
	size_flags_vertical = Control.SIZE_FILL
	name = "SplitContainerItem"

	gui_input.connect(_on_gui_input)

	child_exiting_tree.connect(_on_child_exiting_tree)
	child_entered_tree.connect(_on_child_entered_tree)

func _on_child_entered_tree(n : Node) -> void:
	if n is Control:
		if !n.gui_input.is_connected(_on_gui_input):
			n.gui_input.connect(_on_gui_input)

func _on_child_exiting_tree(n : Node) -> void:
	if n is Control:
		if n.gui_input.is_connected(_on_gui_input):
			n.gui_input.disconnect(_on_gui_input)

	if get_child_count() > 0:
		if get_child(0) != n:
			return
	if !is_queued_for_deletion():
		queue_free()
