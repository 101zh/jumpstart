extends Control

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause") and GameManager.pausable:
		pauseAndResume()

func _on_resume_button_down() -> void:
	resume()

func _on_main_menu_button_down() -> void:
	resume()
	GameManager.change_scene_to_file("res://gameobjects/MainMenu.tscn")
	
func _on_quit_button_down() -> void:
	get_tree().quit()
	
func _on_retry_button_down() -> void:
	resume()
	get_tree().reload_current_scene()

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
