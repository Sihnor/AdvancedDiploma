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
	if sceneID == 0:
		leftNav.visible = false
		topLeftNav.visible = false
		rightNav.visible = false
		topRightNav.visible = false
		if(notebook3D != null):
			notebook3D.visible = false
		if(plush3D != null):
			plush3D.visible = false
		mainNav.visible = true
		if key3D != null:
			key3D.visible = false
	elif sceneID == 1:
		print(sceneID)
		topRightGlobusNav.visible = false
		var tmpNode:Control = get_tree().root.get_node("MainScene/SubViewportContainer2/SubViewport/TopRightGlobusNav/Panel/OpenGlobus")
		if tmpNode != null:
			tmpNode.queue_free()
		topRightGlobusOpenNav.visible = true
	elif sceneID == 2:
		print(sceneID)
		topRightNav.visible = false
		if(plush3D != null):
			plush3D.visible = false
		var tmpNode:Control = get_tree().root.get_node("MainScene/SubViewportContainer2/SubViewport/TopRightGlobusNav/Panel/OpenGlobus")
		if tmpNode != null:
			sceneName = "captain_main_interaction_globusZoom"
		else:
			sceneName = "captain_main_interaction_globusOpen"
		topRightGlobusNav.visible = true
	elif sceneID == 3:
		print(sceneID)
		button.visible = false
		plush3D.visible = true
	elif sceneID == 4:
		print(sceneID)
		mainNav.visible = false
		leftWindowNav.visible = false
		if inventorySystem.findItemInInventory("Notebook") != "":
			sceneName = "captain_left_interaction_pillowMove"
		else:
			var tmpNode:Control = get_tree().root.get_node("MainScene/SubViewportContainer2/SubViewport/LeftNav/Panel/PillowMove")
			tmpNode.button.visible = true
		leftNav.visible = true
	elif  sceneID == 5:
		print(sceneID)
	elif sceneID == 6:
		print(sceneID)
	elif sceneID == 6:
		print(sceneID)
	elif sceneID == 7:
		print(sceneID)
		button.visible = false
		notebook3D.visible = true
	elif sceneID == 8:
		print(sceneID)
		leftNav.visible = false
		if(notebook3D != null):
			notebook3D.visible = false
		leftWindowNav.visible = true
	elif sceneID == 9:
		print(sceneID)
		mainNav.visible = false
		rightDoorNav.visible = false
		rightDoorOpenNav.visible = false
		rightNav.visible = true
	elif sceneID == 10:
		print(sceneID)
		rightNav.visible = false
		var openDoor: Control = get_tree().root.get_node("MainScene/SubViewportContainer2/SubViewport/RightDoorNav/Panel/OpenDoor")
		if openDoor != null:
			sceneName = "captain_right_interaction_exitDoorZoom"
			if inventorySystem.findItemInInventory("Captain Room Key") != "":
				openDoor.visible = true
			else:
				openDoor.visible = false
		else:
			sceneName = "captain_right_interaction_exitDoorZoomKey"
		rightDoorNav.visible = true
	elif sceneID == 11:
		print(sceneID)
		var tmpNode:Control = get_tree().root.get_node("MainScene/SubViewportContainer2/SubViewport/RightDoorNav/Panel/OpenDoor")
		if tmpNode != null:
			tmpNode.queue_free()
		rightDoorNav.visible = false
		rightDoorOpenNav.visible = true
	elif sceneID == 12:
		print(sceneID)
		mainNav.visible = false
		topLeftRadioNav.visible = false
		topLeftBookNav.visible = false
		topLeftMapNav.visible = false
		topLeftDrawerNav.visible = false
		topLeftNav.visible = true
		var tmpNode:Control = get_tree().root.get_node("MainScene/SubViewportContainer2/SubViewport/TopLeftNav/Panel/Drawer")
		if tmpNode != null:
			sceneName = "captain_topLeft"
		else:
			sceneName = "captain_topLeft_interaction_officeOpenDrawer"
			if key3D != null:
				key3D.visible = true
	elif sceneID == 13:
		print(sceneID)
		topLeftNav.visible = false
		if key3D != null:
			key3D.visible = false
		topLeftBookNav.visible = true
	elif sceneID == 14:
		print(sceneID)
		topLeftNav.visible = false
		topLeftDrawerNav.visible = true
		#button.visible = false
	elif sceneID == 15:
		print(sceneID)
		topLeftNav.visible = false
		if key3D != null:
			key3D.visible = false
		topLeftMapNav.visible = true
	elif sceneID == 16:
		print(sceneID)
		button.visible = false
		topLeftDrawerNav.visible = false
		topLeftNav.visible = true
		var tmpNode: Control = get_tree().root.get_node("MainScene/SubViewportContainer2/SubViewport/TopLeftNav/Panel/Drawer")
		tmpNode.queue_free()
		if key3D != null:
			key3D.visible = true
	elif sceneID == 17:
		print(sceneID)
		if key3D != null:
			key3D.visible = false
		topLeftRadioNav.visible = true
		topLeftNav.visible = false
	else :
		print(sceneID)
		mainNav.visible = false
		topRightGlobusNav.visible = false
		topRightGlobusOpenNav.visible = false
		if inventorySystem.findItemInInventory("Plush") != "":
			sceneName = "captain_main_interaction_wardrobeOpen"
		else:
			var tmpNode:Control = get_tree().root.get_node("MainScene/SubViewportContainer2/SubViewport/TopRightNav/Panel/OpenWardrobe")
			tmpNode.button.visible = true
		topRightNav.visible = true
	background.swapBackground(GameManager.getSceneTexture(sceneName))
