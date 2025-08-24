extends Node

var bullets : int  = 1
var last_scene : String = "res://gameobjects/MainMenu.tscn"

func change_scene_to_file(file : String) -> void:
	last_scene = get_tree().current_scene.scene_file_path
	get_tree().change_scene_to_file(file)
	
	
