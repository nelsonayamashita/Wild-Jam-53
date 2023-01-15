extends Resource
class_name Component

@export var attack: int = 0
@export var health: int = 0
@export var speed: int = 0
@export var temperature_limit: int = 0
@export var cooldown: int = 0
@export var special_damage: int = 0
@export var image: Texture2D
@export_enum(SLICE, IMPACT, MAGIC) var attack_type: int = 0
@export_enum(SLICE, IMPACT, MAGIC) var deffense_type: int = 0
@export_enum(COMMON, RARE, LEGENDARY) var rarity: int = 0
@export_enum(OMNI, ATTACK, DEFFENSE, SPECIAL, MOVEMENT, CORE) var componnent_type: int = 0
@export_enum(EFFECT_1, EFFECT_2, EFFECT_3) var effect: int = 0
