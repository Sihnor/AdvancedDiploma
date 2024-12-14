extends Area3D
class_name Book

@export var bookID : String
var parent: BookRiddle
var isSelected: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	parent = self.get_parent()
	parent.addBook(self)
	pass # Replace with function body.

func _on_input_event(camera, event, event_position, normal, shape_idx):
	if Input.is_action_pressed("uiClick"):
		if not parent.isSolved:
			if not isSelected:
				if parent.inputs.size() < 2:
					isSelected = true
					parent.addInput(self)
				if parent.inputs.size()>1:
					parent.swapBook(parent.inputs[0], parent.inputs[1])
					parent.clearInput()
					parent.checkSolution()
					isSelected = false
			else:
				isSelected = false
		pass # Replace with function body.
