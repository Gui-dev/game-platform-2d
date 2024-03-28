extends EnemyBase


@onready var spawn_enemy = $"../spawn_enemy"


func _ready() -> void:
  spawn_instance = preload("res://enemies/cherry.tscn")
  spawn_instance_position = spawn_enemy
  can_spawn = true
  animation.animation_finished.connect(kill_air_enemy)

