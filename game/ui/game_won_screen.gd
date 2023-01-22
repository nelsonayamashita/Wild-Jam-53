extends CanvasLayer

@onready var batler: Node2D = $Batler

func _ready() -> void:
	batler.set_values(
		GlobalData.player_attack,
		GlobalData.player_defence,
		GlobalData.player_special_attack,
		GlobalData.player_movement,
		GlobalData.player_core
	)
	
	
	batler.animation_player.play("won")
	SoundPlayer.won_music.play()


func _on_retry_pressed() -> void:
	get_tree().change_scene_to_file("res://ui/title_screen.tscn")
