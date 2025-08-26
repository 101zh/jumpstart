extends Control

@onready var v_box_container: VBoxContainer = $VBoxContainer

func _ready():
	v_box_container.grab_focus()


func _on_start_button_down() -> void:
	GameManager.change_scene_to_file("res://scenes/Levels/1.tscn")


func _on_levels_button_down() -> void:
	GameManager.change_scene_to_file("res://scenes/LevelsMenu.tscn")


func _on_quit_button_down() -> void:
	get_tree().quit()
