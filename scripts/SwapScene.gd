extends Control

@export var sceneName: String
var background : BackgroundTexture
var mainNav : Control
var leftNav : Control
var topLeftNav : Control
var topLeftRadioNav : Control
var topLeftBookNav : Control
var topLeftMapNav : Control
var rightNav : Control
var topRightNav : Control
@export var sceneID: int
@onready var button = $Button

func _ready():
	background = get_tree().root.get_node("MainScene/SubViewportContainer/SubViewport/Background")
	mainNav = get_tree().root.get_node("MainScene/SubViewportContainer2/SubViewport/MainNav")
	leftNav = get_tree().root.get_node("MainScene/SubViewportContainer2/SubViewport/LeftNav")
	topLeftNav = get_tree().root.get_node("MainScene/SubViewportContainer2/SubViewport/TopLeftNav")
	topLeftRadioNav = get_tree().root.get_node("MainScene/SubViewportContainer2/SubViewport/TopLeftRadioNav")
	topLeftBookNav = get_tree().root.get_node("MainScene/SubViewportContainer2/SubViewport/TopLeftBookNav")
	topLeftMapNav = get_tree().root.get_node("MainScene/SubViewportContainer2/SubViewport/TopLeftMapNav")
	rightNav = get_tree().root.get_node("MainScene/SubViewportContainer2/SubViewport/RightNav")
	topRightNav = get_tree().root.get_node("MainScene/SubViewportContainer2/SubViewport/TopRightNav")
	pass

func _on_button_pressed() -> void:
	if sceneID == 0:
		leftNav.visible = false
		topLeftNav.visible = false
		rightNav.visible = false
		topRightNav.visible = false
		mainNav.visible = true
	elif sceneID == 1:
		print(sceneID)
	elif sceneID == 2:
		print(sceneID)
	elif sceneID == 3:
		print(sceneID)
	elif sceneID == 4:
		print(sceneID)
		mainNav.visible = false
		leftNav.visible = true
	elif  sceneID == 5:
		print(sceneID)
	elif sceneID == 6:
		print(sceneID)
	elif sceneID == 6:
		print(sceneID)
	elif sceneID == 7:
		print(sceneID)
	elif sceneID == 8:
		print(sceneID)
		leftNav.visible = false
	elif sceneID == 9:
		print(sceneID)
		mainNav.visible = false
		rightNav.visible = true
	elif sceneID == 10:
		print(sceneID)
		rightNav.visible = false
	elif sceneID == 11:
		print(sceneID)
	elif sceneID == 12:
		print(sceneID)
		mainNav.visible = false
		topLeftRadioNav.visible = false
		topLeftBookNav.visible = false
		topLeftMapNav.visible = false
		topLeftNav.visible = true
	elif sceneID == 13:
		print(sceneID)
		topLeftNav.visible = false
		topLeftBookNav.visible = true
	elif sceneID == 14:
		print(sceneID)
		button.visible = false
		#topLeftNav.visible = false
	elif sceneID == 15:
		print(sceneID)
		topLeftNav.visible = false
		topLeftMapNav.visible = true
	elif sceneID == 16:
		print(sceneID)
	elif sceneID == 17:
		print(sceneID)
		topLeftRadioNav.visible = true
		topLeftNav.visible = false
	else :
		print(sceneID)
		mainNav.visible = false
		topRightNav.visible = true
	
	background.swapBackground(GameManager.getSceneTexture(sceneName))
