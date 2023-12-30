extends CharacterBody2D

@onready var velocity_component = $VelocityComponent as VelocityComponent
@onready var stick_ability = $Weapon/StickAbility
@onready var weapon = $Weapon

var up_sprite = preload("res://resources/art/player/p_back.png")
var down_sprite = preload("res://resources/art/player/p_front.png")
var left_sprite = preload("res://resources/art/player/p_left.png")
var right_sprite = preload("res://resources/art/player/p_right.png")

var base_speed = 0
var stick_animation_player : AnimationPlayer
var is_attacking : bool = false

func _ready():
	stick_animation_player = stick_ability.get_node("AnimationPlayer")
	base_speed = velocity_component.max_speed
	#weapon.visible = false


func _process(_delta):
	var movement_vector = get_movement_vector()
	if movement_vector == Vector2.DOWN:
		print("down")
	elif movement_vector == Vector2.UP:
		print("up")
	elif movement_vector == Vector2.LEFT:
		print("left")
	elif movement_vector == Vector2.RIGHT:
		print("right")
	
	var direction = movement_vector.normalized()

	velocity_component.accelerate_in_direction(direction)
	velocity_component.move(self)
	
	if Input.is_action_just_pressed("attack"):
		#weapon.visible = true
		is_attacking = true
		stick_animation_player.play("swing")
		await stick_animation_player.animation_finished
		is_attacking = false
		#weapon.visible = false


func get_movement_vector():
	var x_movement = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	var y_movement = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	
	return Vector2(x_movement, y_movement)


func _on_collision_area_for_enemies_body_entered(body):
	print("ow!")
