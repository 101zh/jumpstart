extends Node

var bullets : int = 1;
var last_scene : String = "res://scenes/MainMenu.tscn"
var pausable : bool = true;
var level_count : int = 10

signal enemyCount
signal enemyDeath
signal shoot
signal zeroBullets

func _init() -> void:
	shoot.connect(checkBullets)

func change_scene_to_file(file : String) -> void:
	last_scene = get_tree().current_scene.scene_file_path
	print("Changing to this file: "+file)
	get_tree().change_scene_to_file(file)

func checkBullets() -> void:
	if(bullets<=0):
		zeroBullets.emit()
