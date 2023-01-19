extends Control

@export var component: Resource

@onready var unit_art: TextureRect = $UnitArt
@onready var stat_icon: Node2D = $StatIcon
@onready var element_icon: Node2D = $ElementIcon
@onready var stat_value: Label = $StatValue
@onready var star: Sprite2D = $Star

func _ready() -> void:
	if component == null:
		clear()


func fill(_component: Resource) -> void:
	component = _component
	if component is AttackComponent:
		_update_stat_value(component.attack)
		_show_element_icon(component.attack_type)
		_show_stat_icon("Attack")
	elif component is DefenceComponent:
		_update_stat_value(component.defence)
		_show_element_icon(component.defence_type)
		_show_stat_icon("Defence")
	elif component is MovementComponent:
		_update_stat_value(component.speed)
		_show_element_icon(3)
		_show_stat_icon("Movement")
	elif component is SpecialComponent:
		_update_stat_value(component.special_damage)
		_show_element_icon(component.attack_type)
		_show_stat_icon("Special")
	elif component is CoreComponent:
		_update_stat_value(component.temperature_limit)
		_show_element_icon(3)
		_show_stat_icon("Core")
	
	if component.level == 1:
		star.hide()
	elif component.level == 2:
		star.show()
	
	unit_art.texture = component.image


func random_fill() -> void:
	
	var type: String = ["Attack", "Defence", "Movement", "Special", "Core"][randi() % 5]
	
	match type:
		"Attack":
			component = GlobalData.get_random_attack_component()
			_update_stat_value(component.attack)
			_show_element_icon(component.attack_type)
		"Defence":
			component = GlobalData.get_random_defence_component()
			_update_stat_value(component.defence)
			_show_element_icon(component.defence_type)
		"Movement":
			component = GlobalData.get_random_movement_component()
			_update_stat_value(component.speed)
			_show_element_icon(3) # 3 represents no element
		"Special":
			component = GlobalData.get_random_special_component()
			_update_stat_value(component.special_damage)
			_show_element_icon(component.attack_type)
		"Core":
			component = GlobalData.get_random_core_component()
			_update_stat_value(component.temperature_limit)
			_show_element_icon(3)
		_:
			printerr(type, " is not Attack, Defence, Movement, Special or Core.")

	_show_stat_icon(type)
	unit_art.texture = component.image


func clear() -> void:
	unit_art.texture = null
	component = null
	stat_value.hide()
	star.hide()
	_show_stat_icon("") # Empty string and 3 will hide all elements
	_show_element_icon(3)


func _update_stat_value(value: int) -> void:
	stat_value.text = str(value)
	stat_value.show()


func _show_stat_icon(stat: String) -> void:
	for child in stat_icon.get_children():
		if child.name == stat + "Icon":
			child.show()
		else:
			child.hide()


func _show_element_icon(element: int) -> void:
	var d := {0: "Slice", 1: "Impact", 2: "Energy", 3: "Null"}
	for child in element_icon.get_children():
		if child.name == d[element] + "Icon":
			child.show()
		else:
			child.hide()
