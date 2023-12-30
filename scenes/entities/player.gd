extends CharacterBody2D

@onready var velocity_component = $VelocityComponent as VelocityComponent
@onready var stick_ability = $StickAbility

var base_speed = 0
var stick_animation_player : AnimationPlayer

func _ready():
	stick_animation_player = stick_ability.get_node("AnimationPlayer")
	base_speed = velocity_component.max_speed


func _process(_delta):
	var movement_vector = get_movement_vector()
	var direction = movement_vector.normalized()
	velocity_component.accelerate_in_direction(direction)
	velocity_component.move(self)
	
	if Input.is_action_just_pressed("attack"):
		stick_animation_player.play("swing")


func get_movement_vector():
	var x_movement = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	var y_movement = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	
	return Vector2(x_movement, y_movement)


func _on_collision_area_for_enemies_body_entered(body):
	print("ow!")
