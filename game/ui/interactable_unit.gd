extends Button

signal unit_interacted(unit: Resource)

@onready var unit: Control = %Unit

func buy() -> void:
	unit.clear()
	disabled = true


func random_restore(type: String) -> void:
	disabled = false
	unit.random_fill(type)


func _on_pressed() -> void:
	unit_interacted.emit(unit.component)
