extends RigidBody2D

var last_linear_velocity : Vector2;

func _process(delta: float) -> void:
	last_linear_velocity = linear_velocity

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.pressed and event.button_index==1 and GameManager.bullets>=1:
			queue_free()
			GameManager.bullets-=1
			GameManager.shoot.emit()
