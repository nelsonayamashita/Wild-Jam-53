extends MarginContainer

signal unit_equipped(unit: Resource)

@onready var unit: Control = %Unit
@onready var interact_button: Button = $InteractButton
@onready var actions_menu: VBoxContainer = %ActionsMenu

func _ready() -> void:
	if is_empty():
		interact_button.disabled = true


func store(type: Resource) -> void:
	interact_button.disabled = false
	unit.fill(type)


func clear() -> void:
	interact_button.disabled = true
	unit.clear()


func is_empty() -> bool:
	return unit.component == null


func _on_interact_button_pressed() -> void:
	actions_menu.show()


func _on_mouse_entered_border() -> void:
	if actions_menu.visible:
		actions_menu.hide()


func _on_equip_button_pressed() -> void:
	actions_menu.hide()
	unit_equipped.emit(unit.component)


func _on_sell_button_pressed() -> void:
	actions_menu.hide()
	
	if unit.component.level == 1:
		GlobalData.money += 1
	else:
		GlobalData.money += 3
	
	_add_in_pool(unit.component, unit.component.id)
	unit.clear()
	interact_button.disabled = true


func _add_in_pool(component: Resource, id: int) -> void:
	# don't add base components to the pool
	if id == -1:
		return
	
	var num_to_add := 1
	if component.level == 2:
		num_to_add = 5
	
	var to_append: Array[int]
	to_append.resize(num_to_add)
	to_append.fill(id)
	
	if component is AttackComponent:
		GlobalData.attack_pool += to_append
	elif component is DefenceComponent:
		GlobalData.defence_pool += to_append
	elif component is MovementComponent:
		GlobalData.movement_pool += to_append
	elif component is SpecialComponent:
		GlobalData.movement_pool += to_append
	elif component is CoreComponent:
		GlobalData.movement_pool += to_append
