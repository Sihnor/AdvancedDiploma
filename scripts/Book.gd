extends Area3D
class_name Book

@export var bookID : String

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_input_event(camera, event, event_position, normal, shape_idx):
	if Input.is_action_pressed("uiClick"):
		print(self.name)
		pass # Replace with function body.
