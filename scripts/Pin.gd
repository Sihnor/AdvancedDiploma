extends TextureButton

@export var pinID: int
@export var globusMap: GlobusMap

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if globusMap.getPinnedSize() > 2:
		if globusMap.pinnedID.find(pinID) == -1:
			self.disabled = true
	else:
		if globusMap.pinnedID.find(pinID) == -1:
			self.disabled = false
	if globusMap.isSolved:
		self.button_mask = false

func _on_toggled(toggled_on):
	if toggled_on:
		globusMap.addPin(pinID)
	else:
		globusMap.removePin(pinID)
