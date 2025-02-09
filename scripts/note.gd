extends Area3D
class_name Note

@export var noteID : String
@export var sound: AudioStream
@onready var notePlayer = $"../NotePlayer"
var parent: PianoRiddle
var isSelected: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	parent = self.get_parent()
	parent.addNote(self)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_input_event(camera, event, event_position, normal, shape_idx):
	if Input.is_action_pressed("uiClick"):
		if not parent.isSolved:
			notePlayer.stream = sound
			notePlayer.play()
			parent.addInput(self)
