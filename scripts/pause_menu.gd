extends Control

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		pauseAndResume()

func _on_resume_button_down() -> void:
	pauseAndResume()

func _on_levels_button_down() -> void:
	resume()
	GameManager.change_scene_to_file("res://scenes/LevelsMenu.tscn")

func _on_quit_button_down() -> void:
	get_tree().quit()

func resume():
	get_tree().paused = false
	hide()
	
func pause():
	get_tree().paused = true
	show()

func pauseAndResume():
	if get_tree().paused:
		resume()
	else:
		pause()
