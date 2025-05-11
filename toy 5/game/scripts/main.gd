extends Node2D

@onready var asteroid_container: Node2D = $"asteroid container"
const ASTEROID = preload("res://game/scenes/asteroid.tscn")
var health = 3
var score = 0



func _ready() -> void:
	lose()
	$"game over text".hide()
	pass

func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	var new = ASTEROID.instantiate()
	new.position.x = randi_range(0, get_viewport_rect().size.x)
	new.scale.x = randf_range(1,2)
	new.scale.y = new.scale.x
	new.position.y = - new.scale.y * 15
	asteroid_container.add_child(new)

func on_asteroid_collision(asteroid: Node2D, collision_with: Node2D):
	asteroid.destroy()
	if collision_with == $"exit collider":
		score += 1
	else:
		health -= 1
		$lives.get_child(health).hide()
		$crash.play(0.1)
	if health <= 0: lose()


func lose():
	$Player.controllable = false
	for child in $"asteroid container".get_children(): child.moving = false
	$Timer.stop()
	$"game over text".show()
	$"game over text/score".text = "Your Score: " + str(score)

func _on_start_button_button_up() -> void:
	$background.speed_scale = 3
	$Player.controllable = true
	$Timer.start()
	$"starting text".hide()

func _on_restart_button_button_up() -> void:
	get_tree().reload_current_scene()
