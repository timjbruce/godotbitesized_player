extends Node2D

var player_node: PackedScene = preload("res://Player/Player.tscn")

func _ready() -> void:
	var player_layer: Array[int] = [3]
	var player_mask: Array[int] = [2, 3, 4, 5]
	var enemy_layer: Array[int] = [4]
	var enemy_mask: Array[int] = [2, 3, 4, 5]
	var npc_layer: Array[int] = [5]
	var npc_mask: Array[int] = [2, 3, 4, 5]
	
	var test_cases = [["player", 150, player_layer, player_mask, PlayerShared.PlayerType.Player, null],
						["enemy", 25, enemy_layer, enemy_mask, PlayerShared.PlayerType.Enemy, null],
						["npc", 25, npc_layer, npc_mask, PlayerShared.PlayerType.NPC, null]]
	var p1: player_2d_body
	var i: int = 0
	for test_case in test_cases:
		p1 = player_node.instantiate()
		p1.initialize(test_case[0], test_case[1], test_case[2], test_case[3], test_case[4], test_case[5])
		add_child(p1)
		p1.set_location(Vector2i(i * 50, i * 50))
		i+=1
