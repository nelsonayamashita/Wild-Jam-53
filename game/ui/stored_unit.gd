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
	print("Added n gold")
	unit.clear()
	interact_button.disabled = true
