extends Camera2D
var target_position = Vector2.ZERO

func _ready():
	make_current()
func _process(delta):
	acquire_target()
	global_position =global_position.lerp(target_position,1.0-exp(-delta*10))
func acquire_target():
	var player_node = get_tree().get_nodes_in_group("player")
	if player_node.size()>0:
		var player = player_node[0] as Node2D
		target_position = player.global_position
