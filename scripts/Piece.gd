extends Area3D

@export var gridPosition: Vector2
var puzzleRoot

func _ready():
	puzzleRoot = get_parent()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_input_event(camera, event, event_position, normal, shape_idx):
	if Input.is_action_pressed("uiClick"):
		puzzleRoot.movePiece(self)
