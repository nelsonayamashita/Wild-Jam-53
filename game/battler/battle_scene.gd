extends Control

@export var backgrounds: Array[Texture]

@onready var player_battler: Battler = $PlayerBattler
@onready var oponnent_battler: Battler = $OponnentBattler
@onready var action_timer: Timer = $ActionTimer
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var background: TextureRect = $BackGround


func _ready() -> void:
	player_battler.set_values(
		GlobalData.player_attack,
		GlobalData.player_defence,
		GlobalData.player_special_attack,
		GlobalData.player_movement,
		GlobalData.player_core
	)
	
	_build_opponent(GlobalData.level)
	
	background.texture = backgrounds[randi() % len(backgrounds)]
	SoundPlayer.battle_prepare.play()
	animation_player.play("start")


func _build_opponent(level: int) -> void:
	var attack: AttackComponent = null
	var defence: DefenceComponent = null
	var special: SpecialComponent = null
	var movement: MovementComponent = null
	var core: CoreComponent = null
	
	if level == 0:
		if randf() > 0.5:
			attack = GlobalData.get_random_attack_component()
		if randf() > 0.5:
			defence = GlobalData.get_random_defence_component()
		if randf() > 0.5:
			movement = GlobalData.get_random_movement_component()
		if randf() > 0.5:
			special = GlobalData.get_random_special_component()
		if randf() > 0.5:
			core = GlobalData.get_random_core_component()
	
	if level == 1:
		if randf() > 0.25:
			attack = GlobalData.get_random_attack_component()
		if randf() > 0.25:
			defence = GlobalData.get_random_defence_component()
		if randf() > 0.25:
			movement = GlobalData.get_random_movement_component()
		if randf() > 0.25:
			special = GlobalData.get_random_special_component()
		if randf() > 0.25:
			core = GlobalData.get_random_core_component()
		
	if level >= 2:
		attack = GlobalData.get_random_attack_component()
		defence = GlobalData.get_random_defence_component()
		movement = GlobalData.get_random_movement_component()
		special = GlobalData.get_random_special_component()
		core = GlobalData.get_random_core_component()
	
	if level == 3:
		if randf() > 0.9:
			attack = GlobalData.get_upgrade(attack)
		if randf() > 0.9:
			defence = GlobalData.get_upgrade(defence)
		if randf() > 0.9:
			movement = GlobalData.get_upgrade(movement)
		if randf() > 0.9:
			special = GlobalData.get_upgrade(special)
		if randf() > 0.9:
			core = GlobalData.get_upgrade(core)
	
	if level == 4:
		if randf() > 0.75:
			attack = GlobalData.get_upgrade(attack)
		if randf() > 0.5:
			defence = GlobalData.get_upgrade(defence)
		if randf() > 0.75:
			movement = GlobalData.get_upgrade(movement)
		if randf() > 0.75:
			special = GlobalData.get_upgrade(special)
		if randf() > 0.75:
			core = GlobalData.get_upgrade(core)
	
	if level == 5:
		if randf() > 0.5:
			attack = GlobalData.get_upgrade(attack)
		if randf() > 0.1:
			defence = GlobalData.get_upgrade(defence)
		if randf() > 0.5:
			movement = GlobalData.get_upgrade(movement)
		if randf() > 0.5:
			special = GlobalData.get_upgrade(special)
		if randf() > 0.5:
			core = GlobalData.get_upgrade(core)
	
	if level == 6:
		if randf() > 0.1:
			attack = GlobalData.get_upgrade(attack)
		if randf() > 0.1:
			defence = GlobalData.get_upgrade(defence)
		if randf() > 0.1:
			movement = GlobalData.get_upgrade(movement)
		if randf() > 0.1:
			special = GlobalData.get_upgrade(special)
		if randf() > 0.1:
			core = GlobalData.get_upgrade(core)

	
	oponnent_battler.set_values(
		attack,
		defence,
		special,
		movement,
		core
	)


func _on_action_timer_timeout() -> void:
	var first_to_act: Battler
	var second_to_act: Battler
	if player_battler.speed > oponnent_battler.speed:
		first_to_act = player_battler
		second_to_act = oponnent_battler
	elif oponnent_battler.speed > player_battler.speed:
		first_to_act = oponnent_battler
		second_to_act = player_battler
	else:
		if randf() > 0.5:
			first_to_act = player_battler
			second_to_act = oponnent_battler
		else:
			first_to_act = oponnent_battler
			second_to_act = player_battler
	
	if first_to_act.current_temperature == first_to_act.temperature:
		first_to_act.animation_player.play("special")
	else:
		first_to_act.animation_player.play("attack")
	await first_to_act.animation_player.animation_finished
	first_to_act.animation_player.play("idle")
	
	if second_to_act.defence > 0:
		if second_to_act.current_temperature == second_to_act.temperature:
			second_to_act.animation_player.play("special")
		else:
			second_to_act.animation_player.play("attack")
		await second_to_act.animation_player.animation_finished
		second_to_act.animation_player.play("idle")
	
	if first_to_act.defence > 0 and second_to_act.defence > 0:
		action_timer.start()


func _on_player_battler_attack_contact(attack_damage, attack_type) -> void:
	oponnent_battler.compute_defence(attack_damage, attack_type)
	if oponnent_battler.defence <= 0:
		SoundPlayer.robot_death.play()
		oponnent_battler.animation_player.play("die")


func _on_oponnent_battler_attack_contact(attack_damage, attack_type) -> void:
	player_battler.compute_defence(attack_damage, attack_type)
	if player_battler.defence <= 0:
		SoundPlayer.robot_death.play()
		player_battler.animation_player.play("die")


func _on_player_battler_died() -> void:
	GlobalData.lifes -= 1
	if GlobalData.lifes >= 0:
		animation_player.play("lost")
		SoundPlayer.lost_sound.play()
	else:
		get_tree().change_scene_to_file("res://ui/game_over_screen.tscn")


func _on_oponnent_battler_died() -> void:
	GlobalData.wins += 1
	GlobalData.level += 1
	if GlobalData.wins < 7:
		animation_player.play("won")
		SoundPlayer.won_sound.play()
	else:
		get_tree().change_scene_to_file("res://ui/game_won_screen.tscn")


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "start":
		SoundPlayer.battle_start.play()
		action_timer.start()
	elif anim_name == "lost" or anim_name == "won":
		get_tree().change_scene_to_file("res://ui/shop_screen.tscn")
