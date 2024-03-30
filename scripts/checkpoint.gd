extends Area2D


var is_active: bool = false
@onready var texture = $texture
@onready var marker_position = $marker_position


func activate_checkpoint() -> void:
  Globals.current_checkpoint = marker_position
  texture.play("raising")
  is_active = true


func _on_body_entered(body: CharacterBody2D) -> void:
  if body.name != "player" or is_active:
    return
  activate_checkpoint()


func _on__animation_finished():
  if texture.animation == "raising":
    texture.play("checked")
