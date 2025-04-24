@tool
extends EditorPlugin
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#	https://github.com/CodeNameTwister/Multi-Split-Container
#
#	Multi-Split-Container addon for godot 4
#	author:		"Twister"
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

const ICON : Texture = preload("res://addons/multi_spliter_container/icon/MultiSpliter.svg")
const CLASS : Script = preload("res://addons/multi_spliter_container/multi_split_container.gd")
const NAME : StringName = &"MultiSplitContainer"

func _enter_tree() -> void:
	add_custom_type(NAME, &"Container", CLASS, ICON)

func _exit_tree() -> void:
	remove_custom_type(NAME)
