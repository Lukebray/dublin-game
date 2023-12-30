extends Node2D
class_name StickAbility


@onready var hitbox_component : HitboxComponent = $HitboxComponent

func _ready():
	$HitboxComponent/CollisionShape2D.disabled = true


func _process(_delta):
	pass
	#look_at(get_global_mouse_position())
