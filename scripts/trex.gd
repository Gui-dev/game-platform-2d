extends CharacterBody2D


const FIREBALL = preload("res://prefabs/fireball.tscn")

var direction := 1
@export var health_points: int = 3
@export var move_speed: float = 50.0
@export var target: CharacterBody2D
@onready var sprite: Sprite2D = $sprite
@onready var hurt_sprite: Sprite2D = $sprite/hurt_sprite
@onready var animation_player: AnimationPlayer = $animation_player
@onready var spawn_fireball_point: Marker2D = $spawn_fireball_point
@onready var ground_detector: RayCast2D = $ground_detector
@onready var player_detector = $player_detector
enum EnemyState { ATTACK, HURT, PATROL }
var current_state = EnemyState.PATROL


func _physics_process(_delta) -> void:
  match(current_state):
    EnemyState.PATROL: patrol_state()
    EnemyState.ATTACK: attack_state()
 

func attack_state() -> void:
  animation_player.play("shooting")
  if not player_detector.is_colliding():
    _change_state(EnemyState.PATROL)
  

func hurt_state() -> void:
  animation_player.play("hurt")
  hurt_sprite.visible = true
  await get_tree().create_timer(.3).timeout
  hurt_sprite.visible = false  
  _change_state(EnemyState.PATROL)
  if health_points > 0:
    health_points -= 1
  else :
    queue_free()
 

func patrol_state() -> void:
  animation_player.play("running")
  if is_on_wall():
    flip_enemy()
    
  if not ground_detector.is_colliding():
    flip_enemy()
    
  velocity.x = move_speed * direction
  
  if player_detector.is_colliding():
    _change_state(EnemyState.ATTACK)
      
  move_and_slide()


func _change_state(state) -> void:
  current_state = state
  

func flip_enemy() -> void:
  direction *= -1
  sprite.scale.x *= -1
  player_detector.scale.x *= -1
  spawn_fireball_point.position.x *= -1


func spawn_fireball() -> void:
  var new_fireball = FIREBALL.instantiate()
  if sign(spawn_fireball_point.position.x) == 1:
    new_fireball.set_direction(1)
  else:
    new_fireball.set_direction(-1)
  add_sibling(new_fireball)
  new_fireball.global_position = spawn_fireball_point.global_position
  
  
func _on_hitbox_body_entered(_body):
  _change_state(EnemyState.HURT)
  hurt_state()
