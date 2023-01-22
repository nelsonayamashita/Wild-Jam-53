extends Control

@onready var credits_screen: Control = $CreditsScreen


func _on_credits_button_pressed() -> void:
	SoundPlayer.button_sound.play()
	credits_screen.show()


func _on_start_button_pressed() -> void:
	SoundPlayer.button_sound.play()
	GlobalData.restart()
	get_tree().change_scene_to_file("res://ui/tutorial_screen.tscn")
