extends Control
class_name  BackgroundTexture

@export var textureRect: Control  # Exported variable to assign the main camera
var test = "see"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#print(textureRect)
	#textureRect = get_tree().root.get_node("Background/PanelContainer/TextureRect")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func swapBackground(_texture: CompressedTexture2D) -> void:
	textureRect.texture = _texture
