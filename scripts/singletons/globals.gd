extends Node


var coins := 0
var score := 0
var player_life := 3
var player: CharacterBody2D = null
var current_checkpoint = null
var player_start_position

func respawn_player() -> void:
  if current_checkpoint != null:
    player.position = current_checkpoint.global_position
  else:
    player.global_position = player_start_position.global_position
