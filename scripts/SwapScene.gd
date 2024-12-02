extends Control



@export var sceneSwap : CompressedTexture2D
@export var background : BackgroundText

#@export var isZoom: bool

func _ready():
	
	if sceneSwap != null:
		return


func _on_button_pressed() -> void:
	print("swapScene")
	visible = false
	background.swapBackground(sceneSwap)
