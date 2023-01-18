extends Control

@onready var attack_item: Button = %AttackItem
@onready var defence_item: Button = %DefenceItem
@onready var movement_item: Button = %MovementItem
@onready var special_item: Button = %SpecialItem
@onready var core_item: Button = %CoreItem

@onready var player_assembler: Control = $PlayerAssembler
@onready var defence_battler: Control = $PlayerAssembler/Frame/Head/DefenceBattler
@onready var special_battler: Control = $PlayerAssembler/Frame/Special/SpecialBattler
@onready var core_battler: Control = $PlayerAssembler/Frame/Core/CoreBattler
@onready var attack_battler: Control = $PlayerAssembler/Frame/Arm/AttackBattler
@onready var movement_battler: Control = $PlayerAssembler/Frame/Leg/MovementBattler

@onready var unit_storage: Control = %UnitStorage
@onready var stored_unit_1: MarginContainer = %StoredUnit1
@onready var stored_unit_2: MarginContainer = %StoredUnit2
@onready var stored_unit_3: MarginContainer = %StoredUnit3

@onready var value_label: Label = %ValueLabel


func _ready() -> void:
	attack_item.random_restore("Attack")
	defence_item.random_restore("Defence")
	movement_item.random_restore("Movement")
	special_item.random_restore("Special")
	core_item.random_restore("Core")
	
	GlobalData.money_changed.connect(_on_money_changed)
	GlobalData.money = GlobalData.money # force ui update

# ---Shop---

func _on_attack_item_unit_interacted(_unit: AttackComponent) -> void:
	if GlobalData.money > 0:
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
		elif( 
			_unit.id == attack_battler.unit.component.id
			and _unit.id == stored_unit_1.unit.component.id
			and _unit.id == stored_unit_2.unit.component.id
			and _unit.id == stored_unit_3.unit.component.id
		):
			attack_item.buy()
			attack_battler.clear()
			stored_unit_1.clear()
			stored_unit_2.clear()
			stored_unit_3.clear()
			attack_battler.store(GlobalData.upgrade_attack_components[_unit.id])
		else:
			print("can't")
	else:
		print("can't")


func _on_defence_item_unit_interacted(_unit: DefenceComponent) -> void:
	if GlobalData.money > 0:
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
		elif( 
			_unit.id == defence_battler.unit.component.id
			and _unit.id == stored_unit_1.unit.component.id
			and _unit.id == stored_unit_2.unit.component.id
			and _unit.id == stored_unit_3.unit.component.id
		):
			defence_item.buy()
			defence_battler.clear()
			stored_unit_1.clear()
			stored_unit_2.clear()
			stored_unit_3.clear()
			defence_battler.store(GlobalData.upgrade_defence_components[_unit.id])
		else:
			print("Can't")
	else:
		print("Can't")


func _on_special_item_unit_interacted(_unit: SpecialComponent) -> void:
	if GlobalData.money > 0:
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
		elif( 
			_unit.id == special_battler.unit.component.id
			and _unit.id == stored_unit_1.unit.component.id
			and _unit.id == stored_unit_2.unit.component.id
			and _unit.id == stored_unit_3.unit.component.id
		):
			special_item.buy()
			special_battler.clear()
			stored_unit_1.clear()
			stored_unit_2.clear()
			stored_unit_3.clear()
			special_battler.store(GlobalData.upgrade_special_components[_unit.id])
		else:
			print("Can't")
	else:
		print("Can't")


func _on_movement_item_unit_interacted(_unit: MovementComponent) -> void:
	if GlobalData.money > 0:
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
		elif( 
			_unit.id == movement_battler.unit.component.id
			and _unit.id == stored_unit_1.unit.component.id
			and _unit.id == stored_unit_2.unit.component.id
			and _unit.id == stored_unit_3.unit.component.id
		):
			movement_item.buy()
			movement_battler.clear()
			stored_unit_1.clear()
			stored_unit_2.clear()
			stored_unit_3.clear()
			movement_battler.store(GlobalData.upgrade_movement_components[_unit.id])
		else:
			print("Can't")
	else:
		print("Cant")


func _on_core_item_unit_interacted(_unit: CoreComponent) -> void:
	if GlobalData.money > 0:
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
		elif( 
			_unit.id == core_battler.unit.component.id
			and _unit.id == stored_unit_1.unit.component.id
			and _unit.id == stored_unit_2.unit.component.id
			and _unit.id == stored_unit_3.unit.component.id
		):
			core_item.buy()
			core_battler.clear()
			stored_unit_1.clear()
			stored_unit_2.clear()
			stored_unit_3.clear()
			core_battler.store(GlobalData.upgrade_core_components[_unit.id])
		else:
			print("Can't")
	else:
		print("Cant")


func _on_rerol_button_pressed() -> void:
	if GlobalData.money >= 2:
		GlobalData.money -= 2
		attack_item.random_restore("Attack")
		defence_item.random_restore("Defence")
		movement_item.random_restore("Movement")
		special_item.random_restore("Special")
		core_item.random_restore("Core")
	else:
		print("Can't")

#--Assembler--

func _on_defence_battler_unit_stored(unit) -> void:
	# if can be stored:
	for space in unit_storage.get_children():
		if space is MarginContainer and space.is_empty():
			defence_battler.clear()
			space.store(unit)
			break


func _on_special_battler_unit_stored(unit) -> void:
	for space in unit_storage.get_children():
		if space is MarginContainer and space.is_empty():
			special_battler.clear()
			space.store(unit)
			break


func _on_core_battler_unit_stored(unit) -> void:
	for space in unit_storage.get_children():
		if space is MarginContainer and space.is_empty():
			core_battler.clear()
			space.store(unit)
			break


func _on_attack_battler_unit_stored(unit) -> void:
	for space in unit_storage.get_children():
		if space is MarginContainer and space.is_empty():
			attack_battler.clear()
			space.store(unit)
			break


func _on_movement_battler_unit_stored(unit) -> void:
	for space in unit_storage.get_children():
		if space is MarginContainer and space.is_empty():
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


func _on_money_changed(value: int) -> void:
	value_label.text = str(value)
