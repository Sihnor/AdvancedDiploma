extends Control
class_name SwapScene
@export var sceneName: String
@export var sceneID: int
@onready var button = $Button

var background : BackgroundTexture
var mainNav : Control
var leftNav : Control
var leftWindowNav : Control
var topLeftNav : Control
var topLeftRadioNav : Control
var topLeftBookNav : Control
var topLeftDrawerNav : Control
var topLeftMapNav : Control
var rightNav : Control
var rightDoorNav : Control
var rightDoorOpenNav : Control
var topRightNav : Control
var topRightGlobusNav : Control
var topRightGlobusOpenNav : Control
var notebook3D : PickupItem3D
var plush3D : PickupItem3D
var key3D : PickupItem3D
var inventorySystem : InventorySystem

func _ready():
	background = get_tree().root.get_node("MainScene/SubViewportContainer/SubViewport/Background")
	mainNav = get_tree().root.get_node("MainScene/SubViewportContainer2/SubViewport/MainNav")
	leftNav = get_tree().root.get_node("MainScene/SubViewportContainer2/SubViewport/LeftNav")
	leftWindowNav = get_tree().root.get_node("MainScene/SubViewportContainer2/SubViewport/LeftWindowNav")
	topLeftNav = get_tree().root.get_node("MainScene/SubViewportContainer2/SubViewport/TopLeftNav")
	topLeftRadioNav = get_tree().root.get_node("MainScene/SubViewportContainer2/SubViewport/TopLeftRadioNav")
	topLeftBookNav = get_tree().root.get_node("MainScene/SubViewportContainer2/SubViewport/TopLeftBookNav")
	topLeftDrawerNav = get_tree().root.get_node("MainScene/SubViewportContainer2/SubViewport/TopLeftDrawerNav")
	topLeftMapNav = get_tree().root.get_node("MainScene/SubViewportContainer2/SubViewport/TopLeftMapNav")
	rightNav = get_tree().root.get_node("MainScene/SubViewportContainer2/SubViewport/RightNav")
	rightDoorNav = get_tree().root.get_node("MainScene/SubViewportContainer2/SubViewport/RightDoorNav")
	rightDoorOpenNav = get_tree().root.get_node("MainScene/SubViewportContainer2/SubViewport/RightDoorOpenNav")
	topRightNav = get_tree().root.get_node("MainScene/SubViewportContainer2/SubViewport/TopRightNav")
	topRightGlobusNav = get_tree().root.get_node("MainScene/SubViewportContainer2/SubViewport/TopRightGlobusNav")
	topRightGlobusOpenNav = get_tree().root.get_node("MainScene/SubViewportContainer2/SubViewport/TopRightGlobusOpenNav")
	notebook3D = get_tree().root.get_node("MainScene/SubViewportContainer2/SubViewport/Notebook3D")
	plush3D = get_tree().root.get_node("MainScene/SubViewportContainer2/SubViewport/Plush3D")
	key3D = get_tree().root.get_node("MainScene/SubViewportContainer2/SubViewport/Key3D")
	inventorySystem = get_tree().root.get_node("MainScene/SubViewportContainer2/SubViewport/InventorySystem")
	pass

func _on_button_pressed() -> void:
	SceneManager.switchScene(sceneName, sceneID, button)
