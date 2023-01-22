extends CanvasLayer

@onready var screens := [%FirstScreen, %SecondScreen, %ThirdScreen, %ForthScreen]

var current_screen := 0


func _on_next_button_pressed() -> void:
	SoundPlayer.button_sound.play()
	current_screen += 1
	get_screen(current_screen)


func _on_start_button_pressed() -> void:
	SoundPlayer.button_sound.play()
	get_tree().change_scene_to_file("res://ui/shop_screen.tscn")


func _on_prev_button_pressed() -> void:
	SoundPlayer.button_sound.play()
	current_screen -= 1
	get_screen(current_screen)


func get_screen(num: int) -> void:
	for i in range(len(screens)):
		if i == current_screen:
			screens[i].show()
		else:
			screens[i].hide()
