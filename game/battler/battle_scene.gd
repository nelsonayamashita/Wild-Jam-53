extends Control

@onready var player_battler: Node2D = $PlayerBattler

func _ready() -> void:
	player_battler.set_values(
		GlobalData.player_attack,
		GlobalData.player_defence,
		GlobalData.player_special_attack,
		GlobalData.player_movement,
		GlobalData.player_core
	)


func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_accept"):
		print("aaaa")
		get_tree().change_scene_to_file("res://ui/shop_screen.tscn")
