extends Area2D


@export var transition: CanvasLayer = null
@export var next_level_scene: PackedScene = null


func _on_body_entered(body: CharacterBody2D) -> void:
  if body.name == "player" and next_level_scene != null:
    transition.change_scene(next_level_scene)
  else:
    print("No scene loaded")
