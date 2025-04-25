extends Area2D

var moving = true
const speed = 30
const ASTEROIDS = [
	preload("res://game/assets/asteroids0.png"),
	preload("res://game/assets/asteroids1.png"),
	preload("res://game/assets/asteroids2.png"),
	preload("res://game/assets/asteroids3.png")
]

func _ready() -> void:
	rotate(randf_range(0,2*PI))
	$Sprite2D.texture = ASTEROIDS[randi_range(0,3)]
	

func _process(delta: float) -> void:
	if not moving: return
	position.y += speed * delta

func destroy():
	queue_free()


func _on_body_entered(body: Node2D) -> void:
	get_parent().get_parent().on_asteroid_collision(self, body)
