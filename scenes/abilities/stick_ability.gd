extends Node2D
class_name StickAbility

@onready var hitbox_component : HitboxComponent = $HitboxComponent


func _process(_delta):
	look_at(get_global_mouse_position())
