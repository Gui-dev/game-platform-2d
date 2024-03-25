extends Area2D


var coins := 1
@onready var animated = $animated as AnimatedSprite2D
@onready var collision = $collision


# Called when the node enters the scene tree for the first time.
func _ready():
  pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float):
  pass


func _on_body_entered(_body: Node2D):
  animated.play("collected")
  await collision.call_deferred("queue_free")
  Globals.coins += coins


func _on_animated_animation_finished():
  queue_free()
