class_name Player
extends PlatformerCharacter2D

func _physics_process(delta: float) -> void:	
	velocity.x = move_speed * direction.x
	_apply_gravity(delta)
	move_and_slide()
