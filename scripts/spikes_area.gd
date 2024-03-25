extends Area2D


@onready var collision = $collision
@onready var texture = $texture


# Called when the node enters the scene tree for the first time.
func _ready():
  collision.shape.size = texture.get_rect().size


func _on_body_entered(body: CharacterBody2D) -> void:
  if body.name == "player" && body.has_method("take_damage"):
    body.take_damage(Vector2(0, -250))
