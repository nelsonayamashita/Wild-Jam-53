extends Node2D
class_name Battler

signal attack_contact(attack_damage: float, attack_type: types)
signal died

enum types {SLICE, IMPACT, ENERGY, NORMAL}
enum effects {NONE, CRIT, EVASION, HALF_SPA}

@export var message_scene: PackedScene

# effective[attack][defence]
var effective = {
	0: {0: 0.0, 1: 1.0, 2: -1.0, 3: 0.0},
	1: {0: -1.0, 1: 0.0, 2: 1.0, 3: 0.0},
	2: {0: 1.0, 1: -1.0, 2: 0.0, 3: 0.0},
	3: {0: 0.0, 1: 0.0, 2: 0.0, 3: 0.0},
	}

var attack: int
var attack_type: types

var defence: float : set = _set_defence
var defence_type: types

var special_attack: int
var special_attack_type: types

var speed: int
var speed_level := 1
var speed_effect: effects

var temperature: float
var core_level := 1
var core_effect: effects

var current_temperature := 0.0 : set = _set_temperature

@onready var core: Sprite2D = $Core
@onready var left_arm: Sprite2D = $LeftArm
@onready var right_arm: Sprite2D = $RightArm
@onready var leg: Sprite2D = $Leg
@onready var head: Sprite2D = $Head

@onready var star_core: Sprite2D = $Core/Star
@onready var star_special: Sprite2D = $LeftArm/Star
@onready var star_attack: Sprite2D = $RightArm/Star
@onready var star_movement: Sprite2D = $Leg/Star
@onready var star_defence: Sprite2D = $Head/Star

@onready var life_bar: ProgressBar = $LifeBar
@onready var mana_bar: ProgressBar = $ManaBar

@onready var animation_player: AnimationPlayer = $AnimationPlayer

@onready var info_label_position_1: Marker2D = $InfoLabelPosition1
@onready var info_label_position_2: Marker2D = $InfoLabelPosition2
@onready var info_label_position_3: Marker2D = $InfoLabelPosition3


func set_values(
	_attack: AttackComponent, 
	_defence: DefenceComponent,
	_special_attack: SpecialComponent,
	_speed: MovementComponent,
	_core: CoreComponent
	) -> void:
	
	if _attack:
		right_arm.texture = _attack.image
		attack = _attack.attack
		attack_type = _attack.attack_type
		star_attack.visible = _attack.level > 1
	else:
		right_arm.texture = GlobalData.attack_base.image
		attack = GlobalData.attack_base.attack
		attack_type = 3
	
	if _defence:
		head.texture = _defence.image
		defence = _defence.defence
		defence_type = _defence.defence_type
		star_defence.visible = _defence.level > 1
	else:
		head.texture = GlobalData.defence_base.image
		defence = GlobalData.defence_base.defence
		defence_type = 3
	
	if _special_attack:
		left_arm.texture = _special_attack.image
		special_attack = _special_attack.special_damage
		special_attack_type = _special_attack.attack_type
		star_special.visible = _special_attack.level > 1
	else:
		left_arm.texture = GlobalData.special_base.image
		special_attack = GlobalData.special_base.special_damage
		special_attack_type = 3

	
	if _core:
		core.texture = _core.image
		temperature = _core.temperature_limit
		core_effect = _core.effect
		core_level = _core.level
		star_core.visible = _core.level > 1
	else:
		core.texture = GlobalData.core_base.image
		temperature = GlobalData.core_base.temperature_limit
		core_effect = 0
	
	if _speed:
		leg.texture = _speed.image
		speed = _speed.speed
		speed_effect = _speed.effect
		speed_level = _speed.level
		star_movement.visible = _speed.level > 1
	else:
		leg.texture = GlobalData.movement_base.image
		speed = GlobalData.movement_base.speed
		speed_effect = 0
		
	life_bar.max_value = defence
	life_bar.value = defence
	
	mana_bar.max_value = temperature
	mana_bar.value = 0


func compute_attack() -> void:
	var damage: float = attack
	var crit_chance: float = 0.0
	
	if core_effect == effects.CRIT:
		crit_chance += 0.2
	if speed_effect == effects.CRIT:
		crit_chance += 0.2
	
	if randf() < crit_chance:
		var info_label: Label = message_scene.instantiate()
		info_label.init(info_label_position_1.global_position, "Crit!", Color(1.0, 0, 0))
		owner.add_child(info_label)
		damage *=  1.5
	
	self.current_temperature += 1
	attack_contact.emit(damage, attack_type)


func compute_special_attack() -> void:
	var damage: float = special_attack
	var crit_chance: float = 0.0
	
	if core_effect == effects.CRIT:
		crit_chance += 0.2 + (0.1 * (core_level - 1))
	if speed_effect == effects.CRIT:
		crit_chance += 0.2 + (0.1 * (speed_level - 1))
	
	if randf() < crit_chance:
		var info_label: Label = message_scene.instantiate()
		info_label.init(info_label_position_1.global_position, "Crit!", Color(1.0, 0, 0))
		owner.add_child(info_label)
		damage *=  1.5
	
	if core_effect == effects.HALF_SPA:
		damage *= 0.5
	
	self.current_temperature = 0
	attack_contact.emit(damage, special_attack_type)


func compute_defence(_damage: float, _attack_type: types) -> void:
	var damage: float = _damage + effective[_attack_type][defence_type]
	
	var evade_chance: float = 0.0
	
	
	if speed_effect == effects.EVASION:
		evade_chance += 0.05 + (0.1 * (speed_level - 1))
	
	if effective[_attack_type][defence_type] == 1:
		var info_label: Label = message_scene.instantiate()
		info_label.init(info_label_position_2.global_position, "Super effective!", Color(1.0, 0, 0))
		owner.add_child(info_label)
	elif effective[_attack_type][defence_type] == -1:
		var info_label: Label = message_scene.instantiate()
		info_label.init(info_label_position_2.global_position, "Not very effective...", Color(0.0, 1.0, 0))
		owner.add_child(info_label)
	
	if randf() < evade_chance:
		var info_label: Label = message_scene.instantiate()
		info_label.init(info_label_position_3.global_position, "Dodged!", Color(0, 1.0, 0))
		owner.add_child(info_label)
		damage = 0.0
	
	# inflict damage
	self.defence -= damage
	SoundPlayer.melee_sounds.play()
	
	var info_label: Label = message_scene.instantiate()
	info_label.init(info_label_position_1.global_position, "-"+str(damage), Color(1.0, 0, 0))
	owner.add_child(info_label)
	


func _set_defence(value: float) -> void:
	if value < 0:
		value = 0
	
	var tween: Tween = create_tween()
	tween.set_ease(Tween.EASE_OUT)
	tween.set_trans(Tween.TRANS_CUBIC)
	
	tween.tween_property(life_bar, "value", value, 0.5)
	defence = value


func _set_temperature(value: float) -> void:
	if value > temperature:
		value = temperature
		
	var tween: Tween = create_tween()
	tween.set_ease(Tween.EASE_OUT)
	tween.set_trans(Tween.TRANS_CUBIC)
	
	tween.tween_property(mana_bar, "value", value, 0.5)
	current_temperature = value


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "die":
		died.emit()
