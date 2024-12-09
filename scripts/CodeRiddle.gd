extends Node3D
class_name CodeRiddle

@export var code = []
@export var selectOptions =[]


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if selectOptions.is_empty():
		selectOptions = ["0","1","2","3","4","5","6","7","8","9"]
	if code.is_empty():
		code = ["1" ,"5","3","4"]
		
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
