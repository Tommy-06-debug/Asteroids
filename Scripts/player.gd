extends CharacterBody2D

@export var yaw:float = 270.0
@export var thrust:float = 150.0
@export var friction:float = 0.0
@export var bulletscene:PackedScene

var left_border:float = 0
var right_border:float = 0
var upper_border:float = 0
var lower_border:float = 0

func _physics_process(delta: float) -> void:
	
	rotate(deg_to_rad(Input.get_axis("rotate_left", "rotate_right") * yaw * delta))
	
	if Input.is_action_pressed("thrust"):
		
		velocity += -transform.y * thrust * delta  
	
	velocity = velocity.move_toward(Vector2.ZERO, friction * delta)
	
	move_and_slide()
	wrap_around()

func _input(event: InputEvent) -> void:
	
	if Input.is_action_just_pressed("shoot") and $Timer.is_stopped():
		shoot()
		$Timer.start()

func shoot():
	var bullet = bulletscene.instantiate()
	bullet.global_position = $Muzzle.global_position
	bullet.rotation = rotation
	bullet.inherited_velocity = velocity
	get_parent().add_child(bullet)

func wrap_around():
	if global_position.x < left_border:
		global_position.x = right_border
	if global_position.x > right_border:
		global_position.x = left_border
	if global_position.y < upper_border:
		global_position.y = lower_border
	if global_position.y > lower_border:
		global_position.y = upper_border
