extends StaticBody2D

const speed = 200
const spin_speed = 5
var controllable = true

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if not controllable: return
	if Input.is_action_pressed("ui_up"): position += Vector2(0,-1).rotated(rotation) * speed * delta
	if Input.get_axis("ui_left","ui_right"): rotation += spin_speed * Input.get_axis("ui_left","ui_right") * delta
