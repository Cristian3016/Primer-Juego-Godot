class_name PlatformerCharacter2D
extends CharacterBody2D

signal direction_changed(direction : Vector2)

@export_range(100, 500, 10, "or_greater") var move_speed : float = 300.0
@export var can_ground_jump : bool = true
@export_range(100, 1000, 10, "or_greater") var jump_force : float = 350.0

var direction : Vector2:
	set(value):
		if direction == value:
			return
		direction = value
		direction_changed.emit(direction)

func _physics_process(delta: float):
	velocity.x = move_speed * direction.x
	_apply_gravity(delta)
	move_and_slide()

## Intenta hacer que el personaje salte si está en el suelo
## Tries to make the character jump if it's on the ground
func try_jump() -> bool:	 
	if can_ground_jump and is_on_floor():
		_jump()
		return true
	return false

## Aplica el salto al personaje
## Applies the jump to the character
func _jump():
	velocity.y = -jump_force  

## Aplica la gravedad correctamente
## Applies gravity correctly
func _apply_gravity(delta : float):
	var gravity = ProjectSettings.get("physics/2d/default_gravity")
	if not is_on_floor():
		velocity.y += gravity * delta
