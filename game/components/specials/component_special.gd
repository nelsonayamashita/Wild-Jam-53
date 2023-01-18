extends Resource
class_name SpecialComponent

@export var special_damage: int = 0
@export var id: int = 0
@export var level: int = 1
@export var image: Texture2D
@export var effect: String # TODO: pensar em como implementar efeitos
@export_enum(SLICE, IMPACT, ENERGY, NORMAL) var attack_type: int = 0
