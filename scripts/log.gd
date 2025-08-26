extends RigidBody2D

@export var isShielded : bool = false
@export var impulseStrength : float = 20
var last_linear_velocity : Vector2;

func _process(delta: float) -> void:
	last_linear_velocity = linear_velocity

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.pressed and event.button_index==1 and GameManager.bullets>=1:
			if isShielded:
				var impulseDir : Vector2 = position - event.position
				apply_impulse(impulseDir * impulseStrength, invert(impulseDir))
			else:
				queue_free()
			
			GameManager.bullets-=1
			GameManager.shoot.emit()

func invert(vector2 : Vector2) -> Vector2:
	vector2.x = -vector2.x
	vector2.y = -vector2.y
	return vector2
	
