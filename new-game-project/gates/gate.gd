extends Node


@export var type: String = ""
@export var is_real: bool = true

var inputs = []
var outputs = []



func _process(_delta: float) -> void:
	if type == "NOT": outputs[0] = not inputs[0]
	elif type == "OR": outputs[0] = inputs[0] or inputs[1]
	elif type == "AND": outputs[0] = inputs[0] and outputs[0]
	
