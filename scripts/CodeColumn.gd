extends Node3D

@export var code = [1 ,2,3,4]
var defaultNumbers = [0,0,0,0]
var parent
var children



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	parent = self.get_parent()  # Get the parent of the current node
	children = parent.get_children()  # Get the parent’s children

#	print(get_node(parentNode))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_arrow_up_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if Input.is_action_pressed("uiClick"):
		print("up")
		compare(code, getInputCode())
		

func _on_arrow_down_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	pass # Replace with function body.

func updateCode(array: Array) -> void:
	pass

func getInputCode() -> Array:
	var tmpArray : Array =[]
	for child in children:
		if child is Node3D and not child is Camera3D:
			var label_node = child.get_node("Label3D")
			if label_node and label_node.text.strip_edges() != "":
				var text = label_node.text.strip_edges()
				var number = text.to_int()
				if number != 0 or text == "0":
					tmpArray.append(number)
	return tmpArray

func compare(code: Array, input: Array) -> bool:
	for number in 4:
		print(number)
	return false
