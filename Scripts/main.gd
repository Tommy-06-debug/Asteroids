extends Node2D

var viewport_size:Vector2 = Vector2.ZERO
var camera_center:Vector2 = Vector2.ZERO

var left_border:float = 0
var right_border:float = 0
var upper_border:float = 0
var lower_border:float = 0

func _ready() -> void:
	
	camera_center = $Camera2D.global_position
	viewport_size = Vector2(get_viewport().size)
	
	border_calculation()
	border_shipment()
	
	get_viewport().size_changed.connect(_on_viewport_size_changed)

func _on_viewport_size_changed() -> void:
	
	viewport_size = Vector2(get_viewport().size)
	


func border_calculation():
	left_border = camera_center.x - viewport_size.x / 2
	right_border = camera_center.x + viewport_size.x / 2
	upper_border = camera_center.y - viewport_size.y / 2
	lower_border = camera_center.y + viewport_size.y / 2

func border_shipment():
	$Player.left_border = left_border
	$Player.right_border = right_border
	$Player.upper_border = upper_border
	$Player.lower_border = lower_border
