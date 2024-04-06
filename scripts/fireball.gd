extends CharacterBody2D


var direction := 1
@export var move_speed := 50.0


func _process(delta) -> void:
  position.x += move_speed * direction * delta
  
  
func set_direction(dir: int) -> void:
  direction = dir
  if dir < 0:
    $animation.flip_h = true
  else:
    $animation.flip_h = false
