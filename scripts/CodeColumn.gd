extends Node3D

var code = []
var selectOptions =[]
var parent
var children
@onready var codeRiddle = $".."


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	code = codeRiddle.code
	selectOptions = codeRiddle.selectOptions
	parent = self.get_parent()  # Get the parent of the current node
	children = parent.get_children()  # Get the parent’s children
	var tmpIndex = 0
	for child in children:
		if child is Node3D and not child is Camera3D:
			var label_node = child.get_node("Label3D")
			label_node.text = selectOptions[tmpIndex]
			tmpIndex += 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_arrow_up_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if Input.is_action_pressed("uiClick"):
		var labelNode = self.get_node("Label3D").text.strip_edges()
		var findIndex = selectOptions.find(labelNode)
		if findIndex != -1:
			if findIndex+1 > (selectOptions.size()-1):
				findIndex = 0
			else:
				findIndex = findIndex+1
			var index = selectOptions[findIndex]
			print(index)
			self.get_node("Label3D").text = index
		if compare(code, getInputCode()):
			print("Unlocked!")

func _on_arrow_down_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if Input.is_action_pressed("uiClick"):
		var labelNode = self.get_node("Label3D").text.strip_edges()
		var findIndex = selectOptions.find(labelNode)
		if findIndex != -1:
			if findIndex-1 < 0:
				findIndex = (selectOptions.size()-1)
			else:
				findIndex = findIndex-1
			var index = selectOptions[findIndex]
			print(index)
			self.get_node("Label3D").text = index
		if compare(code, getInputCode()):
			print("Unlocked!")
		

func updateCode(array: Array) -> void:
	pass

func getInputCode() -> Array:
	var tmpArray : Array =[]
	for child in children:
		if child is Node3D and not child is Camera3D:
			var label_node = child.get_node("Label3D")
			if label_node and label_node.text.strip_edges() != "":
				var text = label_node.text.strip_edges()
				tmpArray.append(text)
	return tmpArray

func compare(code: Array, input: Array) -> bool:
	print("input:" , input)
	print("code:" , code)
	if input == code:
		return true
	return false
