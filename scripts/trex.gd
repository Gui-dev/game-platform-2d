extends CharacterBody2D


var direction := 1
@export var health_points := 3
@export var move_speed := 50.0
@onready var sprite = $sprite as Sprite2D
@onready var animation_player = $animation_player as AnimationPlayer
@onready var spawn_fireball_point = $spawn_fireball_point as Marker2D
@onready var ground_detector = $ground_detector as RayCast2D
@onready var player_detector = $player_detector


func _physics_process(delta) -> void:
  if is_on_wall():
    flip_enemy()
    
  if not ground_detector.is_colliding():
    flip_enemy()
    
  velocity.x = move_speed * direction
  
  move_and_slide()
  

func flip_enemy() -> void:
  direction *= -1
  sprite.scale.x *= -1
  player_detector.scale.x *= -1
