extends Node

var background : BackgroundTexture
var mainNav : Control
var leftNav : Control
var leftWindowNav : Control
var leftNotebookCode : Control
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
var portraitPart3D: PickupItem3D
var captainKey3D : PickupItem3D
var slidePuzzleRiddle: SlidePuzzleRiddle
var dairyRiddle: CodeRiddle
var inventorySystem : InventorySystem
var tmpSceneName : String
var tmpSceneID: int

func _ready():
	background = get_tree().root.get_node("MainScene/SubViewportContainer/SubViewport/Background")
	mainNav = get_tree().root.get_node("MainScene/SubViewportContainer2/SubViewport/MainNav")
	leftNav = get_tree().root.get_node("MainScene/SubViewportContainer2/SubViewport/LeftNav")
	leftWindowNav = get_tree().root.get_node("MainScene/SubViewportContainer2/SubViewport/LeftWindowNav")
	leftNotebookCode = get_tree().root.get_node("MainScene/SubViewportContainer2/SubViewport/LeftNotebookCodeNav")
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
	portraitPart3D = get_tree().root.get_node("MainScene/SubViewportContainer2/SubViewport/PortraitPart3D")
	captainKey3D = get_tree().root.get_node("MainScene/SubViewportContainer2/SubViewport/CaptainKey3D")
	slidePuzzleRiddle = get_tree().root.get_node("MainScene/SubViewportContainer2/SubViewport/SlidePuzzleRiddle")
	dairyRiddle = get_tree().root.get_node("MainScene/SubViewportContainer2/SubViewport/DairyRiddle")
	inventorySystem = get_tree().root.get_node("MainScene/SubViewportContainer2/SubViewport/InventorySystem")
	pass

func switchScene(sceneName: String, sceneID: int, button: Button) -> void:
	if sceneID != 5 and sceneID != 99 and sceneID != 6:
		tmpSceneName = sceneName
		tmpSceneID = sceneID
	if sceneID == 99:
		print("sceneID: ", sceneID)
		print("sceneID: ", tmpSceneID)
		sceneID = tmpSceneID
		sceneName = tmpSceneName
		dairyRiddle.visible = false
		leftNotebookCode.visible = false
	print(inventorySystem.isInventoryUsed)
	
	if sceneID == 0:
		leftNav.visible = false
		topLeftNav.visible = false
		rightNav.visible = false
		topRightNav.visible = false
		if(notebook3D != null):
			notebook3D.visible = false
		if(plush3D != null):
			plush3D.visible = false
		if key3D != null:
			key3D.visible = false
		if portraitPart3D != null:
			portraitPart3D.visible = false
		mainNav.visible = true
	elif sceneID == 1:
		print(sceneID)
		topRightGlobusNav.visible = false
		var tmpNode:Control = get_tree().root.get_node("MainScene/SubViewportContainer2/SubViewport/TopRightGlobusNav/Panel/OpenGlobus")
		if tmpNode != null:
			tmpNode.queue_free()
		if portraitPart3D != null:
			portraitPart3D.visible = false
		topRightGlobusOpenNav.visible = true
	elif sceneID == 2:
		print(sceneID)
		topRightNav.visible = false
		if plush3D != null:
			plush3D.visible = false
		if portraitPart3D != null:
			portraitPart3D.visible = false
		var tmpNode:Control = get_tree().root.get_node("MainScene/SubViewportContainer2/SubViewport/TopRightGlobusNav/Panel/OpenGlobus")
		if tmpNode != null:
			sceneName = "captain_main_interaction_globusZoom"
		else:
			sceneName = "captain_main_interaction_globusOpen"
		topRightGlobusNav.visible = true
	elif sceneID == 3:
		print(sceneID)
		print("tmpSceneID:", tmpSceneID)
		print(inventorySystem.isInventoryUsed)
		if not inventorySystem.isInventoryUsed:
			button.visible = false
			inventorySystem.isInventoryUsed = false
		if plush3D != null:
			plush3D.visible = true
		if portraitPart3D != null:
			portraitPart3D.visible = false
		topRightNav.visible = true
	elif sceneID == 4:
		print(sceneID)
		mainNav.visible = false
		leftWindowNav.visible = false
		slidePuzzleRiddle.visible = false
		if captainKey3D != null:
			captainKey3D.visible = false
		if portraitPart3D != null:
			portraitPart3D.visible = false
		if inventorySystem.findItemInInventory("Notebook") != "":
			sceneName = "captain_left_interaction_pillowMove"
		else:
			var tmpNode:Control = get_tree().root.get_node("MainScene/SubViewportContainer2/SubViewport/LeftNav/Panel/PillowMove")
			tmpNode.button.visible = true
		leftNav.visible = true
	elif  sceneID == 5:
		print(sceneID)
		inventorySystem.isInventoryUsed = true
		mainNav.visible = false
		leftNav.visible = false
		leftWindowNav.visible = false
		topLeftNav.visible = false
		topLeftRadioNav.visible = false
		topLeftBookNav.visible = false
		topLeftDrawerNav.visible = false
		topLeftMapNav.visible = false
		rightNav.visible = false
		rightDoorNav.visible = false
		rightDoorOpenNav.visible= false
		topRightNav.visible = false
		topRightGlobusNav.visible = false
		topRightGlobusOpenNav.visible = false
		slidePuzzleRiddle.visible = false

		if notebook3D != null:
			notebook3D.visible = false
		if plush3D != null:
			plush3D.visible = false
		if captainKey3D != null:
			captainKey3D.visible = false
		if key3D != null:
			key3D.visible = false
		if dairyRiddle.solved:
			sceneName = "captain_left_interaction_notebookCodeOpen"
			if portraitPart3D != null:
				portraitPart3D.visible = true
		else:
			dairyRiddle.visible = true
		leftNotebookCode.visible = true
	elif sceneID == 6:
		print(sceneID)
		if portraitPart3D != null:
			portraitPart3D.visible = true
		dairyRiddle.visible = false
		leftNotebookCode.visible = true
	elif sceneID == 7:
		print(sceneID)
		if not inventorySystem.isInventoryUsed:
			button.visible = false
			inventorySystem.isInventoryUsed = false
		if notebook3D != null:
			notebook3D.visible = true
		if portraitPart3D != null:
			portraitPart3D.visible = false
		leftNav.visible = true
	elif sceneID == 8:
		print(sceneID)
		leftNav.visible = false
		if(captainKey3D != null):
			captainKey3D.visible = false
		if portraitPart3D != null:
			portraitPart3D.visible = false
		if(notebook3D != null):
			notebook3D.visible = false
		var applyPuzzle: Control = get_tree().root.get_node("MainScene/SubViewportContainer2/SubViewport/LeftWindowNav/Panel/ApplyPuzzle")
		if applyPuzzle != null:
			if inventorySystem.findItemInInventory("Portrait part") != "":
				applyPuzzle.visible = true
			else:
				applyPuzzle.visible = false
		else:
			slidePuzzleRiddle.visible = true
			if slidePuzzleRiddle.solved:
				if captainKey3D != null:
					captainKey3D.visible = true
		leftWindowNav.visible = true
	elif sceneID == 9:
		print(sceneID)
		mainNav.visible = false
		rightDoorNav.visible = false
		rightDoorOpenNav.visible = false
		if portraitPart3D != null:
			portraitPart3D.visible = false
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
		if portraitPart3D != null:
			portraitPart3D.visible = false
		rightDoorNav.visible = true
	elif sceneID == 11:
		print(sceneID)
		var tmpNode:Control = get_tree().root.get_node("MainScene/SubViewportContainer2/SubViewport/RightDoorNav/Panel/OpenDoor")
		if tmpNode != null:
			tmpNode.queue_free()
		if portraitPart3D != null:
			portraitPart3D.visible = false
		rightDoorNav.visible = false
		rightDoorOpenNav.visible = true
	elif sceneID == 12:
		print(sceneID)
		mainNav.visible = false
		topLeftRadioNav.visible = false
		topLeftBookNav.visible = false
		topLeftMapNav.visible = false
		topLeftDrawerNav.visible = false
		if portraitPart3D != null:
			portraitPart3D.visible = false
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
		if portraitPart3D != null:
			portraitPart3D.visible = false
		topLeftBookNav.visible = true
	elif sceneID == 14:
		print(sceneID)
		topLeftNav.visible = false
		if portraitPart3D != null:
			portraitPart3D.visible = false
		topLeftDrawerNav.visible = true
	elif sceneID == 15:
		print(sceneID)
		topLeftNav.visible = false
		if key3D != null:
			key3D.visible = false
		if portraitPart3D != null:
			portraitPart3D.visible = false
		topLeftMapNav.visible = true
	elif sceneID == 16:
		print(sceneID)
		if not inventorySystem.isInventoryUsed:
			button.visible = false
			inventorySystem.isInventoryUsed = false
		topLeftDrawerNav.visible = false
		topLeftNav.visible = true
		var tmpNode: Control = get_tree().root.get_node("MainScene/SubViewportContainer2/SubViewport/TopLeftNav/Panel/Drawer")
		if tmpNode != null:
			tmpNode.queue_free()
		if key3D != null:
			key3D.visible = true
		if portraitPart3D != null:
			portraitPart3D.visible = false
	elif sceneID == 17:
		print(sceneID)
		if key3D != null:
			key3D.visible = false
		if portraitPart3D != null:
			portraitPart3D.visible = false
		topLeftRadioNav.visible = true
		topLeftNav.visible = false
	elif sceneID == 18 :
		print(sceneID)
		inventorySystem.isInventoryUsed = false
		mainNav.visible = false
		topRightGlobusNav.visible = false
		topRightGlobusOpenNav.visible = false
		if portraitPart3D != null:
			portraitPart3D.visible = false
		if inventorySystem.findItemInInventory("Plush") != "":
			sceneName = "captain_main_interaction_wardrobeOpen"
		else:
			var tmpNode:Control = get_tree().root.get_node("MainScene/SubViewportContainer2/SubViewport/TopRightNav/Panel/OpenWardrobe")
			tmpNode.button.visible = true
		topRightNav.visible = true
	else:
		print("nothing")
	background.swapBackground(GameManager.getSceneTexture(sceneName))
