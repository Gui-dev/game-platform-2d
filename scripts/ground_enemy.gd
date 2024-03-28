extends EnemyBase
 

func _ready() -> void:
  wall_detector = $wall_detector as RayCast2D
  texture = $texture as Sprite2D
  animation.animation_finished.connect(kill_ground_enemy)

func _physics_process(delta) -> void:
  _apply_gravity(delta)
  movement(delta)
  flip_direction() 
