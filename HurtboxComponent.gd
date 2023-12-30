extends Area2D
class_name HurtboxComponent

signal hit(player_velocity, weapon_angle)


@onready var player : CharacterBody2D


func _ready():
	player = get_tree().get_first_node_in_group("player")


func _on_area_entered(area):
	#hit.emit(area.global_rotation)
	hit.emit(player.velocity, area.global_rotation)
