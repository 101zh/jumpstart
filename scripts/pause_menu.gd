extends Control

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		pauseAndResume()

func _on_resume_button_down() -> void:
	pauseAndResume()

func _on_main_menu_button_down() -> void:
	GameManager.change_scene_to_file("res://gameobjects/MainMenu.tscn")
	
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
