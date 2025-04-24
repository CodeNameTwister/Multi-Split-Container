extends Control

func _ready() -> void:
	$Panel/Label.text = """Press DOWN button For Add Container Example

Press UP button For Remove Container Example

Press [0 - 9] number for change max columns value!"""

func _create_node() -> Control:
	var c : ColorRect = ColorRect.new()
	var label : Label = Label.new()
	label.text = "Split Container"
	label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	label.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	label.size_flags_vertical = Control.SIZE_EXPAND_FILL
	c.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	c.size_flags_vertical = Control.SIZE_EXPAND_FILL
	c.color = Color(randf_range(0.0, 1.0),randf_range(0.0, 1.0),randf_range(0.0, 1.0), 1.0)
	c.add_child(label)
	return c

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed(&"ui_down"):
		var n : Control = _create_node()
		var r : Control = get_child(1)
		r.add_child(n)
		n.size = r.size
		n.get_child(0).text += str(" ",n.get_index())
	elif event.is_action_pressed(&"ui_up"):
		var n : Node = get_child(1)
		if n.get_child_count() > 0:
			n.get_child(n.get_child_count() - 1).queue_free()
	elif event is InputEventKey:
		if event.keycode == KEY_0:
			get_child(1).max_columns = 0
		elif event.keycode == KEY_1:
			get_child(1).max_columns = 1
		elif event.keycode == KEY_2:
			get_child(1).max_columns = 2
		elif event.keycode == KEY_3:
			get_child(1).max_columns = 3
		elif event.keycode == KEY_4:
			get_child(1).max_columns = 4
		elif event.keycode == KEY_5:
			get_child(1).max_columns = 5
		elif event.keycode == KEY_6:
			get_child(1).max_columns = 6
		elif event.keycode == KEY_7:
			get_child(1).max_columns = 7
		elif event.keycode == KEY_8:
			get_child(1).max_columns = 8
		elif event.keycode == KEY_9:
			get_child(1).max_columns = 9
