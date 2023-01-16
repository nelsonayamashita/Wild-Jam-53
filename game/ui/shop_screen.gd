extends Control

@onready var attack_item: Button = %AttackItem
@onready var defence_item: Button = %DefenceItem
@onready var movement_item: Button = %MovementItem
@onready var special_item: Button = %SpecialItem
@onready var core_item: Button = %CoreItem

@onready var player_assembler: GridContainer = $PlayerAssembler
@onready var defence_battler: Control = $PlayerAssembler/DefenceBattler
@onready var special_battler: Control = $PlayerAssembler/SpecialBattler
@onready var core_battler: Control = $PlayerAssembler/CoreBattler
@onready var attack_battler: Control = $PlayerAssembler/AttackBattler
@onready var movement_battler: Control = $PlayerAssembler/MovementBattler

@onready var unit_storage: Control = $UnitStorage
@onready var stored_unit_1: MarginContainer = $UnitStorage/StoredUnit1
@onready var stored_unit_2: MarginContainer = $UnitStorage/StoredUnit2
@onready var stored_unit_3: MarginContainer = $UnitStorage/StoredUnit3

func _ready() -> void:
	attack_item.random_restore("Attack")
	defence_item.random_restore("Defence")
	movement_item.random_restore("Movement")
	special_item.random_restore("Special")
	core_item.random_restore("Core")

# ---Store---

func _on_attack_item_unit_interacted(_unit: AttackComponent) -> void:
	if attack_battler.is_empty():
		attack_item.buy()
		attack_battler.store(_unit)
	elif stored_unit_1.is_empty():
		attack_item.buy()
		stored_unit_1.store(_unit)
	elif stored_unit_2.is_empty():
		attack_item.buy()
		stored_unit_2.store(_unit)
	elif stored_unit_3.is_empty():
		attack_item.buy()
		stored_unit_3.store(_unit)
	else:
		print("Can't")


func _on_defence_item_unit_interacted(_unit: DefenceComponent) -> void:
	if defence_battler.is_empty():
		defence_item.buy()
		defence_battler.store(_unit)
	elif stored_unit_1.is_empty():
		defence_item.buy()
		stored_unit_1.store(_unit)
	elif stored_unit_2.is_empty():
		defence_item.buy()
		stored_unit_2.store(_unit)
	elif stored_unit_3.is_empty():
		defence_item.buy()
		stored_unit_3.store(_unit)
	else:
		print("Can't")


func _on_special_item_unit_interacted(_unit: SpecialComponent) -> void:
	if special_battler.is_empty():
		special_item.buy()
		special_battler.store(_unit)
	elif stored_unit_1.is_empty():
		special_item.buy()
		stored_unit_1.store(_unit)
	elif stored_unit_2.is_empty():
		special_item.buy()
		stored_unit_2.store(_unit)
	elif stored_unit_3.is_empty():
		special_item.buy()
		stored_unit_3.store(_unit)
	else:
		print("Can't")


func _on_movement_item_unit_interacted(_unit: MovementComponent) -> void:
	if movement_battler.is_empty():
		movement_item.buy()
		movement_battler.store(_unit)
	elif stored_unit_1.is_empty():
		movement_item.buy()
		stored_unit_1.store(_unit)
	elif stored_unit_2.is_empty():
		movement_item.buy()
		stored_unit_2.store(_unit)
	elif stored_unit_3.is_empty():
		movement_item.buy()
		stored_unit_3.store(_unit)
	else:
		print("Can't")


func _on_core_item_unit_interacted(_unit: CoreComponent) -> void:
	if core_battler.is_empty():
		core_item.buy()
		core_battler.store(_unit)
	elif stored_unit_1.is_empty():
		core_item.buy()
		stored_unit_1.store(_unit)
	elif stored_unit_2.is_empty():
		core_item.buy()
		stored_unit_2.store(_unit)
	elif stored_unit_3.is_empty():
		core_item.buy()
		stored_unit_3.store(_unit)
	else:
		print("Can't")


func _on_rerol_button_pressed() -> void:
	attack_item.random_restore("Attack")
	defence_item.random_restore("Defence")
	movement_item.random_restore("Movement")
	special_item.random_restore("Special")
	core_item.random_restore("Core")

#--Assembler--

func _on_defence_battler_unit_stored(unit) -> void:
	# if can be stored:
	for space in unit_storage.get_children():
		if space.is_empty():
			defence_battler.clear()
			space.store(unit)
			break


func _on_special_battler_unit_stored(unit) -> void:
	for space in unit_storage.get_children():
		if space.is_empty():
			special_battler.clear()
			space.store(unit)
			break


func _on_core_battler_unit_stored(unit) -> void:
	for space in unit_storage.get_children():
		if space.is_empty():
			core_battler.clear()
			space.store(unit)
			break


func _on_attack_battler_unit_stored(unit) -> void:
	for space in unit_storage.get_children():
		if space.is_empty():
			attack_battler.clear()
			space.store(unit)
			break


func _on_movement_battler_unit_stored(unit) -> void:
	for space in unit_storage.get_children():
		if space.is_empty():
			movement_battler.clear()
			space.store(unit)
			break

#--Storage--

func _on_stored_unit_1_equipped(unit) -> void:
	if unit is AttackComponent:
		if attack_battler.is_empty():
			stored_unit_1.clear()
			attack_battler.store(unit)
	elif unit is DefenceComponent:
		if defence_battler.is_empty():
			stored_unit_1.clear()
			defence_battler.store(unit)
	elif unit is MovementComponent:
		if movement_battler.is_empty():
			stored_unit_1.clear()
			movement_battler.store(unit)
	elif unit is SpecialComponent:
		if special_battler.is_empty():
			stored_unit_1.clear()
			special_battler.store(unit)
	elif unit is CoreComponent:
		if core_battler.is_empty():
			stored_unit_1.clear()
			core_battler.store(unit)

func _on_stored_unit_2_equipped(unit)-> void:
	if unit is AttackComponent:
		if attack_battler.is_empty():
			stored_unit_2.clear()
			attack_battler.store(unit)
	elif unit is DefenceComponent:
		if defence_battler.is_empty():
			stored_unit_2.clear()
			defence_battler.store(unit)
	elif unit is MovementComponent:
		if movement_battler.is_empty():
			stored_unit_2.clear()
			movement_battler.store(unit)
	elif unit is SpecialComponent:
		if special_battler.is_empty():
			stored_unit_2.clear()
			special_battler.store(unit)
	elif unit is CoreComponent:
		if core_battler.is_empty():
			stored_unit_2.clear()
			core_battler.store(unit)

func _on_stored_unit_3_equipped(unit)-> void:
	if unit is AttackComponent:
		if attack_battler.is_empty():
			stored_unit_3.clear()
			attack_battler.store(unit)
	elif unit is DefenceComponent:
		if defence_battler.is_empty():
			stored_unit_3.clear()
			defence_battler.store(unit)
	elif unit is MovementComponent:
		if movement_battler.is_empty():
			stored_unit_3.clear()
			movement_battler.store(unit)
	elif unit is SpecialComponent:
		if special_battler.is_empty():
			stored_unit_3.clear()
			special_battler.store(unit)
	elif unit is CoreComponent:
		if core_battler.is_empty():
			stored_unit_3.clear()
			core_battler.store(unit)
