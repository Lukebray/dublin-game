extends CharacterBody2D

@export var acceleration : float = 10
@export var knockback_strength : float = 50.0


func _process(delta):
	print("velocity -> ", velocity)
	velocity = velocity * knockback_strength
#	velocity = velocity.lerp(Vector2.ZERO, 1 - exp(-acceleration * get_process_delta_time()))
	move_and_slide()


#func _on_hurtbox_component_hit(weapon_angle):
#	var perpendicular_direction = Vector2(cos(weapon_angle + PI / 2), sin(weapon_angle + PI / 2))
#	print(perpendicular_direction)
#
#	velocity = perpendicular_direction * knockback_strength


