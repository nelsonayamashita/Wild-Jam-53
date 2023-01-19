extends Node2D
class_name Battler

enum types {SLICE, IMPACT, ENERGY, NORMAL}


var attack: int
var attack_type: types

var defence: int
var defence_type: types

var special_attack: int
var special_attack_type: types

var speed: int
var temperature: int

@onready var core: Sprite2D = $Core
@onready var left_arm: Sprite2D = $LeftArm
@onready var right_arm: Sprite2D = $RightArm
@onready var leg: Sprite2D = $Leg
@onready var head: Sprite2D = $Head

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
	else:
		right_arm.texture = GlobalData.attack_base.image
		attack = GlobalData.attack_base.attack
		attack_type = 3
	
	if _defence:
		head.texture = _defence.image
		defence = _defence.defence
		defence_type = _defence.defence_type
	else:
		head.texture = GlobalData.defence_base.image
		defence = GlobalData.defence_base.defence
		defence_type = 3
	
	if _special_attack:
		left_arm.texture = _special_attack.image
		special_attack = _special_attack.special_damage
		special_attack_type = _special_attack.attack_type
	else:
		left_arm.texture = GlobalData.special_base.image
		special_attack = GlobalData.special_base.special_damage
		special_attack = 3
	
	if _core:
		core.texture = _core.image
		temperature = _core.temperature_limit
	else:
		core.texture = GlobalData.core_base.image
		temperature = GlobalData.core_base.temperature_limit
	
	if _speed:
		leg.texture = _speed.image
		speed = _speed.speed
	else:
		leg.texture = GlobalData.movement_base.image
		speed = GlobalData.movement_base.speed

