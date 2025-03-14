class_name Projectile
extends RigidBody2D
## Moving object launched from some source that can collide with other objects  
## within the scene

@export_range(0, 300, .2, "or_greater") var initial_velocity : float = 300.0

func launch(p_move_direction : Vector2) :
	linear_velocity = initial_velocity * p_move_direction
	
	
