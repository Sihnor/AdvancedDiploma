extends Control
class_name  BackgroundText

@onready var textureRect = $PanelContainer/TextureRect
var test = "see"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func swapBackground(_texture: CompressedTexture2D) -> void:
	textureRect.texture = _texture
