extends Control

@onready var grid_container: GridContainer = $GridContainer
var LEVEL_BUTTON = preload("res://gameobjects/LevelButton.tscn")

func _ready():
	for i in range(GameManager.level_count):
		var levelButton : Button = LEVEL_BUTTON.instantiate()
		levelButton.text = str(i+1)
		grid_container.add_child(levelButton)
		

func _on_back_button_down() -> void:
	GameManager.change_scene_to_file(GameManager.last_scene)
	
