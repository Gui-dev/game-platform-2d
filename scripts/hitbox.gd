extends Area2D


func _on_body_entered(body: CharacterBody2D) -> void:
  print("HIT_ 1: ", body.name)  
  if body.name == "player":
    print("HIT_2: ", body.name)
    body.velocity.y = -body.jump_velocity
    body.animation.play("hurt")
