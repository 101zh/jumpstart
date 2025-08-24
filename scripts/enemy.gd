extends RigidBody2D

const speedThreshold : float = 40.0
const fallingSpeedThreshold : float = 350
var last_linear_velocity : Vector2;

func _process(delta: float) -> void:
	print(position)

func _physics_process(delta):
	for node in get_colliding_bodies():
		if node is RigidBody2D:
			var body : RigidBody2D = node
			var relativeVelocity : Vector2 = abs(body.linear_velocity - last_linear_velocity)
			print("colliding with "+ node.name+" ; at "+str(relativeVelocity.length()))
			if relativeVelocity.length() > speedThreshold:
				queue_free()
		elif node is StaticBody2D:
			var body : StaticBody2D = node
			if abs(last_linear_velocity.y) > fallingSpeedThreshold:
				print("fall damage")
				queue_free()
				
	last_linear_velocity = linear_velocity

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.pressed and event.button_index==1 and GameManager.bullets>=1:
			print("sniped")
			queue_free()
			GameManager.bullets-=1
