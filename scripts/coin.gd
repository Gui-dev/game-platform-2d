extends Area2D

@onready var animated = $animated as AnimatedSprite2D
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float):
	pass


func _on_body_entered(_body: Node2D):
	animated.play("collected")


func _on_animated_animation_finished():
	queue_free()
