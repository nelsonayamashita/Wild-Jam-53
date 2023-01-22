extends Node

@onready var sell_sound: AudioStreamPlayer = $SellSound
@onready var restore_sound: AudioStreamPlayer = $RestoreSound
@onready var buy_sound: AudioStreamPlayer = $BuySound
@onready var store_sound: AudioStreamPlayer = $StoreSound
@onready var battle_prepare: AudioStreamPlayer = $BattlePrepare
@onready var battle_start: AudioStreamPlayer = $BattleStart
@onready var melee_sounds: AudioStreamPlayer = $MeleeSounds
@onready var robot_death: AudioStreamPlayer = $RobotDeath
@onready var negative_sound: AudioStreamPlayer = $NegativeSound
@onready var lost_sound: AudioStreamPlayer = $LostSound
@onready var won_sound: AudioStreamPlayer = $WonSound
@onready var lost_music: AudioStreamPlayer = $LostMusic
@onready var won_music: AudioStreamPlayer = $WonMusic
@onready var button_sound: AudioStreamPlayer = $ButtonSound
