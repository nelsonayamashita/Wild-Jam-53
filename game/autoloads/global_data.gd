extends Node

signal money_changed(value: int)

@export var attack_components: Array[AttackComponent]
@export var defence_components: Array[DefenceComponent]
@export var movement_components: Array[MovementComponent]
@export var special_components: Array[SpecialComponent]
@export var core_components: Array[CoreComponent]

@export var upgrade_attack_components: Array[AttackComponent]
@export var upgrade_defence_components: Array[DefenceComponent]
@export var upgrade_movement_components: Array[MovementComponent]
@export var upgrade_special_components: Array[SpecialComponent]
@export var upgrade_core_components: Array[CoreComponent]

var attack_base: AttackComponent = load("res://components/attacks/attack_base.tres")
var defence_base: DefenceComponent = load("res://components/defence/defence_base.tres")
var movement_base: MovementComponent = load("res://components/movements/movement_base.tres")
var special_base: SpecialComponent = load("res://components/specials/special_base.tres")
var core_base: CoreComponent = load("res://components/cores/core_base.tres")

var attack_pool: Array[int]
var defence_pool: Array[int]
var movement_pool: Array[int]
var special_pool: Array[int]
var core_pool: Array[int]

var player_attack: AttackComponent
var player_defence: DefenceComponent
var player_special_attack: SpecialComponent
var player_movement: MovementComponent
var player_core: CoreComponent

var stored_component_1: Resource
var stored_component_2: Resource
var stored_component_3: Resource

var money: int = 10 : set = _set_money

func _ready() -> void:
	attack_pool = _create_pool(len(attack_components))
	defence_pool = _create_pool(len(defence_components))
	movement_pool = _create_pool(len(movement_components))
	special_pool = _create_pool(len(special_components))
	core_pool = _create_pool(len(core_components))


func get_upgrade(unit: Resource) -> Resource:
	var id: int = unit.id
	
	if unit is AttackComponent:
		return upgrade_attack_components[id]
	elif unit is DefenceComponent:
		return upgrade_defence_components[id]
	elif unit is SpecialComponent:
		return upgrade_special_components[id]
	elif unit is MovementComponent:
		return upgrade_movement_components[id]
	elif unit is CoreComponent:
		return upgrade_core_components[id]
	return null


func get_random_attack_component() -> AttackComponent:
	attack_pool.shuffle()
	return attack_components[attack_pool[0]]


func get_random_defence_component() -> DefenceComponent:
	defence_pool.shuffle()
	return defence_components[defence_pool[0]]


func get_random_movement_component() -> MovementComponent:
	movement_pool.shuffle()
	return movement_components[movement_pool[0]]


func get_random_special_component() -> SpecialComponent:
	special_pool.shuffle()
	return special_components[special_pool[0]]


func get_random_core_component() -> CoreComponent:
	core_pool.shuffle()
	return core_components[core_pool[0]]


func _set_money(value: int) -> void:
	money = value
	money_changed.emit(value)


func _create_pool(lenght: int) -> Array[int]:
	var array: Array[int]
	for i in range(0, lenght):
		var a: Array[int]
		a.resize(15)
		a.fill(i)
		array += a
	return array
