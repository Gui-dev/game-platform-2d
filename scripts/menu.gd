extends CanvasLayer


@onready var resume_button = $menu_holder/resume_button
@onready var quit_button = $menu_holder/quit_button

# Called when the node enters the scene tree for the first time.
func _ready():
  visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
  pass
  

func _unhandled_input(event: InputEvent) -> void:
  if event.is_action_pressed("ui_cancel"):
    visible = true
    get_tree().paused = true
    resume_button.grab_focus()

func _on_resume_button_pressed():
  get_tree().paused = false
  visible = false


func _on_quit_button_pressed():
  get_tree().quit()
