extends CharacterBody2D

@onready var velocity_component = $VelocityComponent as VelocityComponent

var base_speed = 0

func _ready():
	base_speed = velocity_component.max_speed


func _process(_delta):
	var movement_vector = get_movement_vector()
	var direction = movement_vector.normalized()
	velocity_component.accelerate_in_direction(direction)
	velocity_component.move(self)
	$StickAbility.look_at(get_global_mouse_position().rotated(PI/2))
	
	if Input.is_action_just_pressed("attack"):
		print("attack")
		#stick_ability.get_node("AnimationPlayer").play("hit")


func get_movement_vector():
	var x_movement = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	var y_movement = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	
	return Vector2(x_movement, y_movement)

