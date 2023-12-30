extends CharacterBody2D

@export var acceleration : float = 1
@export var knockback_strength : float = 50


func _process(delta):
	velocity = velocity.lerp(Vector2.ZERO, 1 - exp(-acceleration * get_process_delta_time()))
	move_and_slide()


func _on_hurtbox_component_hit(weapon_angle):
	var perpendicular_direction = Vector2(cos(weapon_angle), sin(weapon_angle))

	velocity = perpendicular_direction * knockback_strength * acceleration


