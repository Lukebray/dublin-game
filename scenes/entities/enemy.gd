extends CharacterBody2D

@onready var velocity_component = $VelocityComponent as VelocityComponent

@export var knockback_strength : float = 500


func _process(delta):
	velocity_component.accelerate_to_player()
	velocity_component.move(self)


func _on_hurtbox_component_hit(player_velocity, weapon_angle):
	#var perpendicular_direction = Vector2(cos(weapon_angle), sin(weapon_angle))
	velocity = -velocity.normalized() * knockback_strength * velocity_component.acceleration
	move_and_slide()


