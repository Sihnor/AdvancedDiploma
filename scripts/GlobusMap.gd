extends Control
class_name GlobusMap

@export var solution:Array=[]
@export var reward:SwapScene
var pinnedID: Array = []
var isSolved = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	pass

func addPin(idPin):
	pinnedID.append(idPin)
	compareSolution()
	
func removePin(idPin):
	pinnedID.erase(idPin)

func getPinnedSize() -> int:
	return pinnedID.size()

func compareSolution():
	var count = 0
	for pin in pinnedID:
		if solution.find(pin) != -1:
			count += 1
	if count == 3:
		isSolved = true
		reward.visible = true
		self.visible = false
		print("solved")
