extends Node

@export var stick_ability : PackedScene

var stick_animation_player : AnimationPlayer
var player : CharacterBody2D
var base_damage = 5

func _ready():
	player = get_tree().get_first_node_in_group("player")

func _process(_delta):
	if Input.is_action_just_pressed("attack"):
		handle_weapon_attack()


func handle_weapon_attack():
	var stick_instance = stick_ability.instantiate() as StickAbility
	stick_instance.global_position = player.global_position
	stick_animation_player = stick_instance.get_node("AnimationPlayer")
	
	var foreground_layer = get_tree().get_first_node_in_group("foreground_layer") as Node
	foreground_layer.add_child(stick_instance)
	
	
	
	
	
