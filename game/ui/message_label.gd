extends Label

func _ready() -> void:
	position -= size/2
	var tween := create_tween()
	tween.finished.connect(queue_free)
	
	var new_pos = position + Vector2(0, -8)
	tween.tween_property(self, "position", new_pos, 1.0).from_current()



func init(pos: Vector2, message: String, color: Color) -> void:
	text = message
	position = pos
	add_theme_color_override("font_color", color)
