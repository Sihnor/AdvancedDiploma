extends MeshInstance3D


var rotation_speed: float =60.0

func _ready():

	pass

func _process(delta):
	rotation.y += deg_to_rad(rotation_speed) * delta
	pass
