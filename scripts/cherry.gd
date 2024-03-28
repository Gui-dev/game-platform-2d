extends EnemyBase


func _ready() -> void:
  animation.animation_finished.connect(kill_air_enemy)

func _physics_process(delta):
  _apply_gravity(delta)
  movement(delta)
