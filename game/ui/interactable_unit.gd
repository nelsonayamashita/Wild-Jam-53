extends Button

signal unit_interacted(unit: Resource)

@onready var unit: Control = %Unit
@onready var price_container: MarginContainer = $PriceContainer

func buy() -> void:
	_remove_from_pool(unit.component)
	GlobalData.money -= 1
	price_container.hide()
	unit.clear()
	disabled = true
	SoundPlayer.buy_sound.play()


func random_restore() -> void:
	disabled = false
	price_container.show()
	unit.random_fill()
	SoundPlayer.restore_sound.play()


func _on_pressed() -> void:
	unit_interacted.emit(unit.component)


func _remove_from_pool(component: Resource) -> void:
	if component is AttackComponent:
		GlobalData.attack_pool.pop_front()
	elif component is DefenceComponent:
		GlobalData.defence_pool.pop_front()
	elif component is MovementComponent:
		GlobalData.movement_pool.pop_front()
	elif component is SpecialComponent:
		GlobalData.movement_pool.pop_front()
	elif component is CoreComponent:
		GlobalData.movement_pool.pop_front()
