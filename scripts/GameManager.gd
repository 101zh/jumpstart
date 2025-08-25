extends Node

var bullets : int;
var last_scene : String = "res://gameobjects/MainMenu.tscn"

signal enemyCount
signal enemyDeath

func change_scene_to_file(file : String) -> void:
	last_scene = get_tree().current_scene.scene_file_path
	get_tree().change_scene_to_file(file)
	
	
