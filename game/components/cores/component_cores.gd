extends Resource
class_name CoreComponent

@export var temperature_limit: int = 0
@export var image: Texture2D
@export var effect: String # TODO: pensar em como implementar efeitos
@export_enum(COMMON, RARE, LEGENDARY) var rarity: int = 0
