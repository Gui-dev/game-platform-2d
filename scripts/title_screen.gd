extends Control

@export var change_scene: PackedScene = null


func _ready() -> void:
  Globals.coins = 0
  Globals.score = 0
  Globals.player_life = 3


func _on_start_button_pressed():
  get_tree().change_scene_to_packed(change_scene)


func _on_credits_button_pressed():
  pass # Replace with function body.


func _on_quit_button_pressed():
  get_tree().quit()
