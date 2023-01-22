extends Resource
class_name DefenceComponent

@export var defence: int = 0
@export var id: int = 0
@export var level: int = 1
@export var image: Texture2D
@export_multiline var tooltip: String
@export_enum(NONE, CRIT, EVASION, HALF_SPA) var effect: int = 0
@export_enum(SLICE, IMPACT, ENERGY, NORMAL) var defence_type: int = 0
