extends Node

@export var attack_components: Array[AttackComponent]
@export var defence_components: Array[DefenceComponent]
@export var movement_components: Array[MovementComponent]
@export var special_components: Array[SpecialComponent]
@export var core_components: Array[CoreComponent]

func get_random_attack_component() -> AttackComponent:
	return attack_components[randi() % len(attack_components)]

func get_random_defence_component() -> DefenceComponent:
	return defence_components[randi() % len(defence_components)]

func get_random_movement_component() -> MovementComponent:
	return movement_components[randi() % len(movement_components)]

func get_random_special_component() -> SpecialComponent:
	return special_components[randi() % len(special_components)]

func get_random_core_component() -> CoreComponent:
	return core_components[randi() % len(core_components)]
