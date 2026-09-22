extends Area2D

@export var speed:float = 400

var inherited_velocity:Vector2 = Vector2.ZERO
var direction:Vector2 = Vector2.ZERO
var velocity:Vector2 = Vector2.ZERO

func _ready() -> void:
	
	direction = -transform.y
	
	velocity = inherited_velocity + direction * speed

func _physics_process(delta: float) -> void:
	
	position += velocity * delta

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
