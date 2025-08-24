extends Button

const pathToLevels : String = "res://scenes/Levels/"
@onready var thisButton: Button = $"."

func _on_button_down() -> void:
	GameManager.change_scene_to_file(pathToLevels+thisButton.text+".tscn")
