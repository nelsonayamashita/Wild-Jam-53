extends Control

@onready var defence_battler: MarginContainer = %DefenceBattler
@onready var special_battler: MarginContainer = %SpecialBattler
@onready var core_battler: MarginContainer = %CoreBattler
@onready var attack_battler: MarginContainer = %AttackBattler
@onready var movement_battler: MarginContainer = %MovementBattler

#func _ready() -> void:
#	defence_battler.store(load("res://components/defence/defence_base.tres"))
#	special_battler.store(load("res://components/specials/special_base.tres"))
#	core_battler.store(load("res://components/cores/core_base.tres"))
#	attack_battler.store(load("res://components/attacks/attack_base.tres"))
#	movement_battler.store(load("res://components/movements/movement_base.tres"))
