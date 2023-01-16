extends Resource
class_name AttackComponent

@export var attack: int = 0
@export var image: Texture2D
@export var effect: String # TODO: pensar em como implementar efeitos
@export_enum(SLICE, IMPACT, ENERGY) var attack_type: int = 0
@export_enum(COMMON, RARE, LEGENDARY) var rarity: int = 0
