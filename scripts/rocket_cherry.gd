extends CharacterBody2D


@onready var animation = $animation as AnimatedSprite2D
@export var enemy_score := 150


func _on_hitbox_body_entered(_body: CharacterBody2D) -> void:
  animation.play("hurt")


func _on_animation_animation_finished():
  if animation.animation == "hurt":
    queue_free()
    Globals.score += enemy_score
