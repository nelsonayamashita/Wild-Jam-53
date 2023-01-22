extends Control


@onready var credits: RichTextLabel = $MarginContainer/MarginContainer/VBoxContainer/Credits


func _on_close_button_pressed() -> void:
	SoundPlayer.button_sound.play()
	hide()


func _on_credits_meta_clicked(meta) -> void:
	OS.shell_open(meta)
