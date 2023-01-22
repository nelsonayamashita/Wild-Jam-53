extends Control

@onready var shop_item_1: Button = %ShopItem1
@onready var shop_item_2: Button = %ShopItem2
@onready var shop_item_3: Button = %ShopItem3
@onready var shop_item_4: Button = %ShopItem4
@onready var shop_item_5: Button = %ShopItem5

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

@onready var money_icon: TextureRect = %MoneyIcon
@onready var value_label: Label = %ValueLabel
@onready var life_label: Label = %LifeLabel
@onready var wins_label: Label = %WinsLabel


func _ready() -> void:
	shop_item_1.random_restore()
	shop_item_2.random_restore()
	shop_item_3.random_restore()
	shop_item_4.random_restore()
	shop_item_5.random_restore()
	
	GlobalData.money_changed.connect(_on_money_changed)
	GlobalData.money = 12
	
	life_label.text = str(GlobalData.lifes).pad_zeros(2)
	wins_label.text = str(GlobalData.wins) + " / 7"
	
	if GlobalData.player_attack:
		attack_battler.store(GlobalData.player_attack)
	
	if GlobalData.player_defence:
		defence_battler.store(GlobalData.player_defence)
	
	if GlobalData.player_special_attack:
		special_battler.store(GlobalData.player_special_attack)
	
	if GlobalData.player_movement:
		movement_battler.store(GlobalData.player_movement)
	
	if GlobalData.player_core:
		core_battler.store(GlobalData.player_core)
	
	if GlobalData.stored_component_1:
		stored_unit_1.store(GlobalData.stored_component_1)
		
	if GlobalData.stored_component_2:
		stored_unit_2.store(GlobalData.stored_component_2)
		
	if GlobalData.stored_component_3:
		stored_unit_3.store(GlobalData.stored_component_3)

# ---Shop---

func _on_shop_item_1_unit_interacted(_unit: Resource) -> void:
	var player_battler: Control
	if _unit is AttackComponent:
		player_battler = attack_battler
	elif _unit is DefenceComponent:
		player_battler = defence_battler
	elif _unit is MovementComponent:
		player_battler = movement_battler
	elif _unit is SpecialComponent:
		player_battler = special_battler
	elif _unit is CoreComponent:
		player_battler = core_battler
	
	if GlobalData.money > 0:
		if player_battler.is_empty():
			shop_item_1.buy()
			player_battler.store(_unit)
		elif stored_unit_1.is_empty():
			shop_item_1.buy()
			stored_unit_1.store(_unit)
		elif stored_unit_2.is_empty():
			shop_item_1.buy()
			stored_unit_2.store(_unit)
		elif stored_unit_3.is_empty():
			shop_item_1.buy()
			stored_unit_3.store(_unit)
		elif( 
			_unit.id == player_battler.unit.component.id
			and _unit.id == stored_unit_1.unit.component.id
			and _unit.id == stored_unit_2.unit.component.id
			and _unit.id == stored_unit_3.unit.component.id
		):
			shop_item_1.buy()
			player_battler.clear()
			stored_unit_1.clear()
			stored_unit_2.clear()
			stored_unit_3.clear()
			player_battler.store(GlobalData.get_upgrade(_unit))
		else:
			SoundPlayer.negative_sound.play()
	else:
		SoundPlayer.negative_sound.play()


func _on_shop_item_2_unit_interacted(_unit: Resource) -> void:
	var player_battler: Control
	if _unit is AttackComponent:
		player_battler = attack_battler
	elif _unit is DefenceComponent:
		player_battler = defence_battler
	elif _unit is MovementComponent:
		player_battler = movement_battler
	elif _unit is SpecialComponent:
		player_battler = special_battler
	elif _unit is CoreComponent:
		player_battler = core_battler
	
	if GlobalData.money > 0:
		if player_battler.is_empty():
			shop_item_2.buy()
			player_battler.store(_unit)
		elif stored_unit_1.is_empty():
			shop_item_2.buy()
			stored_unit_1.store(_unit)
		elif stored_unit_2.is_empty():
			shop_item_2.buy()
			stored_unit_2.store(_unit)
		elif stored_unit_3.is_empty():
			shop_item_2.buy()
			stored_unit_3.store(_unit)
		elif( 
			_unit.id == player_battler.unit.component.id
			and _unit.id == stored_unit_1.unit.component.id
			and _unit.id == stored_unit_2.unit.component.id
			and _unit.id == stored_unit_3.unit.component.id
		):
			shop_item_2.buy()
			player_battler.clear()
			stored_unit_1.clear()
			stored_unit_2.clear()
			stored_unit_3.clear()
			player_battler.store(GlobalData.get_upgrade(_unit))
		else:
			SoundPlayer.negative_sound.play()
	else:
		SoundPlayer.negative_sound.play()


func _on_shop_item_3_unit_interacted(_unit: Resource) -> void:
	var player_battler: Control
	if _unit is AttackComponent:
		player_battler = attack_battler
	elif _unit is DefenceComponent:
		player_battler = defence_battler
	elif _unit is MovementComponent:
		player_battler = movement_battler
	elif _unit is SpecialComponent:
		player_battler = special_battler
	elif _unit is CoreComponent:
		player_battler = core_battler
	
	if GlobalData.money > 0:
		if player_battler.is_empty():
			shop_item_3.buy()
			player_battler.store(_unit)
		elif stored_unit_1.is_empty():
			shop_item_3.buy()
			stored_unit_1.store(_unit)
		elif stored_unit_2.is_empty():
			shop_item_3.buy()
			stored_unit_2.store(_unit)
		elif stored_unit_3.is_empty():
			shop_item_3.buy()
			stored_unit_3.store(_unit)
		elif( 
			_unit.id == player_battler.unit.component.id
			and _unit.id == stored_unit_1.unit.component.id
			and _unit.id == stored_unit_2.unit.component.id
			and _unit.id == stored_unit_3.unit.component.id
		):
			shop_item_3.buy()
			player_battler.clear()
			stored_unit_1.clear()
			stored_unit_2.clear()
			stored_unit_3.clear()
			player_battler.store(GlobalData.get_upgrade(_unit))
		else:
			SoundPlayer.negative_sound.play()
	else:
		SoundPlayer.negative_sound.play()


func _on_shop_item_4_unit_interacted(_unit: Resource) -> void:
	var player_battler: Control
	if _unit is AttackComponent:
		player_battler = attack_battler
	elif _unit is DefenceComponent:
		player_battler = defence_battler
	elif _unit is MovementComponent:
		player_battler = movement_battler
	elif _unit is SpecialComponent:
		player_battler = special_battler
	elif _unit is CoreComponent:
		player_battler = core_battler
	
	if GlobalData.money > 0:
		if player_battler.is_empty():
			shop_item_4.buy()
			player_battler.store(_unit)
		elif stored_unit_1.is_empty():
			shop_item_4.buy()
			stored_unit_1.store(_unit)
		elif stored_unit_2.is_empty():
			shop_item_4.buy()
			stored_unit_2.store(_unit)
		elif stored_unit_3.is_empty():
			shop_item_4.buy()
			stored_unit_3.store(_unit)
		elif( 
			_unit.id == player_battler.unit.component.id
			and _unit.id == stored_unit_1.unit.component.id
			and _unit.id == stored_unit_2.unit.component.id
			and _unit.id == stored_unit_3.unit.component.id
		):
			shop_item_4.buy()
			player_battler.clear()
			stored_unit_1.clear()
			stored_unit_2.clear()
			stored_unit_3.clear()
			player_battler.store(GlobalData.get_upgrade(_unit))
		else:
			SoundPlayer.negative_sound.play()
	else:
		SoundPlayer.negative_sound.play()


func _on_shop_item_5_unit_interacted(_unit: Resource) -> void:
	var player_battler: Control
	if _unit is AttackComponent:
		player_battler = attack_battler
	elif _unit is DefenceComponent:
		player_battler = defence_battler
	elif _unit is MovementComponent:
		player_battler = movement_battler
	elif _unit is SpecialComponent:
		player_battler = special_battler
	elif _unit is CoreComponent:
		player_battler = core_battler
	
	if GlobalData.money > 0:
		if player_battler.is_empty():
			shop_item_5.buy()
			player_battler.store(_unit)
		elif stored_unit_1.is_empty():
			shop_item_5.buy()
			stored_unit_1.store(_unit)
		elif stored_unit_2.is_empty():
			shop_item_5.buy()
			stored_unit_2.store(_unit)
		elif stored_unit_3.is_empty():
			shop_item_5.buy()
			stored_unit_3.store(_unit)
		elif( 
			_unit.id == player_battler.unit.component.id
			and _unit.id == stored_unit_1.unit.component.id
			and _unit.id == stored_unit_2.unit.component.id
			and _unit.id == stored_unit_3.unit.component.id
		):
			shop_item_5.buy()
			player_battler.clear()
			stored_unit_1.clear()
			stored_unit_2.clear()
			stored_unit_3.clear()
			player_battler.store(GlobalData.get_upgrade(_unit))
		else:
			SoundPlayer.negative_sound.play()
	else:
		SoundPlayer.negative_sound.play()


func _on_rerol_button_pressed() -> void:
	if GlobalData.money >= 2:
		GlobalData.money -= 2
		shop_item_1.random_restore()
		shop_item_2.random_restore()
		shop_item_3.random_restore()
		shop_item_4.random_restore()
		shop_item_5.random_restore()
	else:
		SoundPlayer.negative_sound.play()

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

# ------

func _on_money_changed(value: int) -> void:
	value_label.text = str(value).pad_zeros(2)


func _on_start_button_pressed() -> void:
	GlobalData.player_attack = attack_battler.unit.component
	GlobalData.player_defence = defence_battler.unit.component
	GlobalData.player_special_attack = special_battler.unit.component
	GlobalData.player_movement = movement_battler.unit.component
	GlobalData.player_core = core_battler.unit.component
	

	GlobalData.stored_component_1 = stored_unit_1.unit.component
	GlobalData.stored_component_2 = stored_unit_2.unit.component
	GlobalData.stored_component_3 = stored_unit_3.unit.component

	get_tree().change_scene_to_file("res://battler/battle_scene.tscn")

