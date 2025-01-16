extends Control
class_name GlobusMap

@export var solution:Array=[]
@export var reward:SwapScene
@export var audioStreamPlayer:AudioStreamPlayer
@export var sound:AudioStream
@export var rewardSound:AudioStream
var pinnedID: Array = []
var isSolved = false

# Called when the node enters the scene tree for the first time.
func _ready():
	if sound != null:
		audioStreamPlayer.stream = sound

func _process(delta):
	pass

func addPin(idPin):
	audioStreamPlayer.play()
	pinnedID.append(idPin)
	compareSolution()
	
func removePin(idPin):
	audioStreamPlayer.play()
	pinnedID.erase(idPin)

func getPinnedSize() -> int:
	return pinnedID.size()

func compareSolution():
	var count = 0
	for pin in pinnedID:
		if solution.find(pin) != -1:
			count += 1
	if count == 3:
		if rewardSound != null:
			audioStreamPlayer.stream = rewardSound
		audioStreamPlayer.play()
		isSolved = true
		reward.visible = true
		self.visible = false
		print("solved")
