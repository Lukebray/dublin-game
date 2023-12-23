extends Camera2D

var target_position = Vector2.ZERO


func _ready():
	make_current() #just make this camera active


func _process(delta):
	acquire_target() #here it's the player
	global_position = global_position.lerp(target_position, 1.0 - exp(-delta * 20))


func acquire_target():
	var player_nodes = get_tree().get_nodes_in_group("player")
	if player_nodes.size() > 0:
		var player = player_nodes[0] as Node2D #if there's more than 1 player, just make it the first one in the list
		target_position = player.global_position
