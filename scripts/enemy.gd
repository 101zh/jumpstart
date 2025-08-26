extends RigidBody2D

@export var isShielded : bool = false
@export var impulseStrength : float = 175.0
const speedThreshold : float = 175
const fallingSpeedThreshold : float = 350
var last_linear_velocity : Vector2;

func _ready():
	GameManager.enemyCount.emit()

func _physics_process(delta):
	for node in get_colliding_bodies():
		if node is RigidBody2D:
			var body : RigidBody2D = node
			var relativeVelocity : Vector2 = abs(node.last_linear_velocity - last_linear_velocity)
			print("colliding with "+ node.name+" ; at "+str(relativeVelocity.length()))
			if relativeVelocity.length() > speedThreshold:
				die()
		elif node is StaticBody2D:
			var body : StaticBody2D = node
			if abs(last_linear_velocity.y) > fallingSpeedThreshold:
				print("fall damage")
				die()
				
	last_linear_velocity = linear_velocity

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.pressed and event.button_index==1 and GameManager.bullets>=1:
			print("sniped")
			if isShielded:
				var impulseDir : Vector2 = position - event.position
				apply_impulse(impulseDir.normalized() * impulseStrength)
			else:
				die()
			
			GameManager.bullets-=1
			GameManager.shoot.emit()

func die() -> void:
	GameManager.enemyDeath.emit()
	queue_free()
