extends CharacterBody2D

@export var yaw:float = 270.0
@export var thrust:float = 150.0
@export var friction:float = 0.0

func _physics_process(delta: float) -> void:
	
	rotate(deg_to_rad(Input.get_axis("rotate_left", "rotate_right") * yaw * delta))
	
	if Input.is_action_pressed("thrust"):
		
		velocity += -transform.y * thrust * delta  
	
	velocity = velocity.move_toward(Vector2.ZERO, friction * delta)
	
	move_and_slide()
