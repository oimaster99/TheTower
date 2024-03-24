extends Area2D

var tile_size = 64

@onready var ray = $RayCast2D

var inputs = {"ui_right": Vector2.RIGHT,
			  "ui_left": Vector2.LEFT,
			  "ui_up": Vector2.UP,
			  "ui_down": Vector2.DOWN}
			
func _ready():
	position = position.snapped(Vector2.ONE * tile_size)
	position += Vector2.ONE * tile_size/2
	
func _unhandled_input(event):
	for dir in inputs.keys():
		if event.is_action_pressed(dir):
			move(dir)
			
func move(dir):
	ray.target_position = inputs[dir] * tile_size
	ray.force_raycast_update()
	if !ray.is_colliding():
		position += inputs[dir] * tile_size


