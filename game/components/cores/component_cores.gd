extends Resource
class_name CoreComponent

@export var temperature_limit: int = 0
@export var id: int = 0
@export var level: int = 1
@export var image: Texture2D
@export_multiline var tooltip: String
@export_enum(NONE, CRIT, EVASION, HALF_SPA) var effect: int = 0
