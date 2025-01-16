extends Node3D

var code = []
var selectOptions =[]
var parent
var rewardSound:AudioStream
var children
@onready var codeRiddle: CodeRiddle = $".."
@export var audioStreamPlayer:AudioStreamPlayer
@export var sound:AudioStream


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if sound != null:
		audioStreamPlayer.stream = sound
	code = codeRiddle.code
	selectOptions = codeRiddle.selectOptions
	parent = self.get_parent()
	children = parent.get_children()  
#	print(code)
	if codeRiddle.rewardSound != null:
		rewardSound = codeRiddle.rewardSound
	setDefault()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_arrow_up_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if not codeRiddle.solved:
		if Input.is_action_pressed("uiClick"):
			if sound != null:
				audioStreamPlayer.play()
			var labelNode = self.get_node("Label3D").text.strip_edges()
			var findIndex = selectOptions.find(labelNode)
			if findIndex != -1:
				if findIndex+1 > (selectOptions.size()-1):
					findIndex = 0
				else:
					findIndex = findIndex+1
				var index = selectOptions[findIndex]
				self.get_node("Label3D").text = index
			if compare(code, getInputCode()):
				codeRiddle.solved = true
				if codeRiddle.swapScene:
					SceneManager.switchScene(codeRiddle.sceneName, codeRiddle.sceneID, null)
				else:
					self.visible =false
				if codeRiddle.rewardItem != null:
					codeRiddle.rewardItem.visible = true
				print("Unlocked!")
				parent.visible = false
				audioStreamPlayer.stream = rewardSound
				audioStreamPlayer.play()
				await get_tree().create_timer(0.2).timeout  # Creates a 1-second delay
				codeRiddle.queue_free()

func _on_arrow_down_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if not codeRiddle.solved:
		if Input.is_action_pressed("uiClick"):
			if sound != null:
				audioStreamPlayer.play()
			var labelNode = self.get_node("Label3D").text.strip_edges()
			var findIndex = selectOptions.find(labelNode)
			if findIndex != -1:
				if findIndex-1 < 0:
					findIndex = (selectOptions.size()-1)
				else:
					findIndex = findIndex-1
				var index = selectOptions[findIndex]
				self.get_node("Label3D").text = index
			if compare(code, getInputCode()):
				codeRiddle.solved = true
				if codeRiddle.swapScene:
					SceneManager.switchScene(codeRiddle.sceneName, codeRiddle.sceneID, null)
				else:
					self.visible =false
					
				if codeRiddle.rewardItem != null:
					codeRiddle.rewardItem.visible = true
				print("Unlocked!")
				parent.visible = false
				audioStreamPlayer.stream = rewardSound
				audioStreamPlayer.play()
				await get_tree().create_timer(0.2).timeout  # Creates a 1-second delay
				codeRiddle.queue_free()

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

func setDefault() -> void:
	for child in children:
		if child is Node3D and not child is Camera3D:
			child.get_node("Label3D").text = selectOptions[0]

func compare(code: Array, input: Array) -> bool:
	if input == code:
		return true
	return false
