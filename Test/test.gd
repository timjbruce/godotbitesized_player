extends Node2D

var player_node: PackedScene = preload("res://Player/Player.tscn")

func _ready() -> void:
	var layer: Array[int] = [2]
	var mask: Array[int] = [2]
	var test_cases = [["Tim", 500, layer, mask, player_2d_body.PlayerType.Player, null],
						["Tim", 500, layer, mask, player_2d_body.PlayerType.NPC, null],
						["Tim", 500, layer, mask, player_2d_body.PlayerType.Enemy, null]]
	var p1: player_2d_body
	var i: int = 0
	for test_case in test_cases:
		p1 = player_node.instantiate()
		p1.initialize(test_case[0], test_case[1], test_case[2], test_case[3], test_case[4], test_case[5])
		add_child(p1)
		p1.set_location(Vector2i(i * 50, i * 50))
		i+=1
