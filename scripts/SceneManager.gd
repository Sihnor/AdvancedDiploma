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

var dininghall01Nav : Control
var dininghall02Nav : Control
var dininghall03Nav : Control
var dininghall031Nav : Control
var dininghall04Nav : Control
var dininghall041Nav : Control
var dininghall05Nav : Control
var dininghall051Nav : Control

var notebook3D : PickupItem3D
var plush3D : PickupItem3D
var personalFile3D : PickupItem3D
var portraitPart3D: PickupItem3D
var captainKey3D : PickupItem3D
var closetKey3D : PickupItem3D
var chair3D : PickupItem3D
var seahoundStatue3D : PickupItem3D
var dolphineStatue3D : PickupItem3D
var candle3D : PickupItem3D

var slidePuzzleRiddle: SlidePuzzleRiddle
var dairyRiddle: CodeRiddle
var letterRiddle: CodeRiddle
var bookRiddle: BookRiddle

var interactionMeridith : DialogueInteration
var interactionCrazyGuy : DialogueInteration

var inventorySystem : InventorySystem
var dialogueSystem : DialogueSystem

var exitDoorUnlocked : bool = false
var tmpSceneName : String
var tmpSceneID: int
var visitedScenes: Array = []

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
	dininghall01Nav = get_tree().root.get_node("MainScene/SubViewportContainer2/SubViewport/Dininghall01Nav")
	dininghall02Nav = get_tree().root.get_node("MainScene/SubViewportContainer2/SubViewport/Dininghall02Nav")
	dininghall03Nav = get_tree().root.get_node("MainScene/SubViewportContainer2/SubViewport/Dininghall03Nav")
	dininghall031Nav = get_tree().root.get_node("MainScene/SubViewportContainer2/SubViewport/Dininghall031Nav")
	dininghall04Nav = get_tree().root.get_node("MainScene/SubViewportContainer2/SubViewport/Dininghall04Nav")
	dininghall041Nav = get_tree().root.get_node("MainScene/SubViewportContainer2/SubViewport/Dininghall041Nav")
	dininghall05Nav = get_tree().root.get_node("MainScene/SubViewportContainer2/SubViewport/Dininghall05Nav")
	dininghall051Nav = get_tree().root.get_node("MainScene/SubViewportContainer2/SubViewport/Dininghall051Nav")
	
	notebook3D = get_tree().root.get_node("MainScene/SubViewportContainer2/SubViewport/Notebook3D")
	plush3D = get_tree().root.get_node("MainScene/SubViewportContainer2/SubViewport/Plush3D")
	personalFile3D = get_tree().root.get_node("MainScene/SubViewportContainer2/SubViewport/PersonalFile3D")
	portraitPart3D = get_tree().root.get_node("MainScene/SubViewportContainer2/SubViewport/PortraitPart3D")
	captainKey3D = get_tree().root.get_node("MainScene/SubViewportContainer2/SubViewport/CaptainKey3D")
	closetKey3D = get_tree().root.get_node("MainScene/SubViewportContainer2/SubViewport/ClosetKey3D")
	chair3D = get_tree().root.get_node("MainScene/SubViewportContainer2/SubViewport/Chair3D")
	seahoundStatue3D = get_tree().root.get_node("MainScene/SubViewportContainer2/SubViewport/SeahoundStatue3D")
	dolphineStatue3D = get_tree().root.get_node("MainScene/SubViewportContainer2/SubViewport/DolphineStatue3D")
	candle3D = get_tree().root.get_node("MainScene/SubViewportContainer2/SubViewport/Candle3D")
	
	slidePuzzleRiddle = get_tree().root.get_node("MainScene/SubViewportContainer2/SubViewport/SlidePuzzleRiddle")
	dairyRiddle = get_tree().root.get_node("MainScene/SubViewportContainer2/SubViewport/DairyRiddle")
	letterRiddle = get_tree().root.get_node("MainScene/SubViewportContainer2/SubViewport/TopLeftDrawerNav/Panel/LetterRiddle")
	bookRiddle = get_tree().root.get_node("MainScene/SubViewportContainer2/SubViewport/TopLeftBookNav/BookRiddle")
	
	interactionMeridith = get_tree().root.get_node("MainScene/SubViewportContainer2/SubViewport/MeridithInteraction")
	interactionCrazyGuy = get_tree().root.get_node("MainScene/SubViewportContainer2/SubViewport/CrazyGuyInteraction")
	
	inventorySystem = get_tree().root.get_node("MainScene/SubViewportContainer2/SubViewport/InventorySystem")
	dialogueSystem = get_tree().root.get_node("MainScene/SubViewportContainer2/SubViewport/DialogueSystem")
	
	if letterRiddle != null:
			letterRiddle.visible =false
	if bookRiddle != null:
			bookRiddle.visible =false
	pass

func switchScene(sceneName: String, sceneID: int, button: Button) -> void:
	if sceneID != 5 and sceneID != 99 and sceneID != 6:
		tmpSceneName = sceneName
		tmpSceneID = sceneID
	if sceneID == 99:
		print("sceneID: ", sceneID)
		sceneID = tmpSceneID
		sceneName = tmpSceneName
		if dairyRiddle != null:
			dairyRiddle.visible = false
		leftNotebookCode.visible = false
	
	if sceneID == 0:
		print("sceneID: ", sceneID)
		leftNav.visible = false
		topLeftNav.visible = false
		rightNav.visible = false
		topRightNav.visible = false
		if(notebook3D != null):
			notebook3D.visible = false
		if(plush3D != null):
			plush3D.visible = false
		if personalFile3D != null:
			personalFile3D.visible = false
		if closetKey3D != null:
			closetKey3D.visible = false
		if portraitPart3D != null:
			portraitPart3D.visible = false
		mainNav.visible = true
	elif sceneID == 1:
		print("sceneID: ", sceneID)
		topRightGlobusNav.visible = false
		if not sceneID in visitedScenes:
			visitedScenes.append(sceneID)
			dialogueSystem.filePath = "res://Assets/JSON/Dialogues/Scene1/GlobeWithPin.json"
			dialogueSystem.dialogues = dialogueSystem.loadDialoguesFromJSON(dialogueSystem.filePath)
			dialogueSystem.currentIndex = 0
			dialogueSystem.updateDialogue()
			dialogueSystem.visible =true
		var tmpNode:Control = get_tree().root.get_node("MainScene/SubViewportContainer2/SubViewport/TopRightGlobusNav/Panel/OpenGlobus")
		if tmpNode != null:
			background.swapBackground(GameManager.getSceneTexture(sceneName))
			await get_tree().create_timer(0.1).timeout  # Creates a 1-second delay
			tmpNode.queue_free()
		if portraitPart3D != null:
			portraitPart3D.visible = false
		topRightGlobusOpenNav.visible = true
	elif sceneID == 2:
		print("sceneID: ", sceneID)
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
		print("sceneID: ", sceneID)
		if not inventorySystem.isInventoryUsed:
			button.visible = false
			inventorySystem.isInventoryUsed = false
		if plush3D != null:
			plush3D.visible = true
		if portraitPart3D != null:
			portraitPart3D.visible = false
		topRightNav.visible = true
	elif sceneID == 4:
		print("sceneID: ", sceneID)
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
		print("sceneID: ", sceneID)
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
		if personalFile3D != null:
			personalFile3D.visible = false
		if closetKey3D != null:
			closetKey3D.visible = false
		if letterRiddle != null:
			letterRiddle.visible = false
		if bookRiddle != null:
			bookRiddle.visible =false
		if dairyRiddle == null:
			sceneName = "captain_left_interaction_notebookCodeOpen"
			if portraitPart3D != null:
				portraitPart3D.visible = true
		else:
			dairyRiddle.visible = true
		leftNotebookCode.visible = true
	elif sceneID == 6:
		print("sceneID: ", sceneID)
		if not sceneID in visitedScenes:
			visitedScenes.append(sceneID)
			dialogueSystem.filePath = "res://Assets/JSON/Dialogues/Scene1/CaptainsJournalUnderPillow.json"
			dialogueSystem.dialogues = dialogueSystem.loadDialoguesFromJSON(dialogueSystem.filePath)
			dialogueSystem.currentIndex = 0
			dialogueSystem.updateDialogue()
			dialogueSystem.visible =true
		
		if portraitPart3D != null:
			portraitPart3D.visible = true
		dairyRiddle.visible = false
		leftNotebookCode.visible = true
	elif sceneID == 7:
		print("sceneID: ", sceneID)
		if not inventorySystem.isInventoryUsed:
			button.visible = false
			inventorySystem.isInventoryUsed = false
		if notebook3D != null:
			notebook3D.visible = true
		if portraitPart3D != null:
			portraitPart3D.visible = false
		leftNav.visible = true
	elif sceneID == 8:
		print("sceneID: ", sceneID)
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
				if not sceneID in visitedScenes:
					visitedScenes.append(sceneID)
					dialogueSystem.filePath = "res://Assets/JSON/Dialogues/Scene1/PortraitCaptain.json"
					dialogueSystem.dialogues = dialogueSystem.loadDialoguesFromJSON(dialogueSystem.filePath)
					dialogueSystem.currentIndex = 0
					dialogueSystem.updateDialogue()
					dialogueSystem.visible =true
			
				if captainKey3D != null:
					captainKey3D.visible = true
		leftWindowNav.visible = true
	elif sceneID == 9:
		print("sceneID: ", sceneID)
		mainNav.visible = false
		rightDoorNav.visible = false
		rightDoorOpenNav.visible = false
		if portraitPart3D != null:
			portraitPart3D.visible = false
		rightNav.visible = true
	elif sceneID == 10:
		print("sceneID: ", sceneID)
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
			sceneID = 11
			switchScene(sceneName, sceneID, null)
		if portraitPart3D != null:
			portraitPart3D.visible = false
		rightDoorNav.visible = true
	elif sceneID == 11:
		print("sceneID: ", sceneID)
		await get_tree().create_timer(0.1).timeout  # Creates a 1-second delay
		if not sceneID in visitedScenes:
			visitedScenes.append(sceneID)
			dialogueSystem.filePath = "res://Assets/JSON/Dialogues/Scene1/RadioWhisper.json"
			dialogueSystem.dialogues = dialogueSystem.loadDialoguesFromJSON(dialogueSystem.filePath)
			dialogueSystem.currentIndex = 0
			dialogueSystem.updateDialogue()
			dialogueSystem.visible =true
		exitDoorUnlocked = true
		var tmpNode:Control = get_tree().root.get_node("MainScene/SubViewportContainer2/SubViewport/RightDoorNav/Panel/OpenDoor")
		if tmpNode != null:
			tmpNode.queue_free()
		if portraitPart3D != null:
			portraitPart3D.visible = false
		if chair3D != null:
			chair3D.visible = false
		rightDoorNav.visible = false
		dininghall01Nav.visible = false
		rightDoorOpenNav.visible = true
	elif sceneID == 12:
		print("sceneID: ", sceneID)
		mainNav.visible = false
		topLeftRadioNav.visible = false
		topLeftBookNav.visible = false
		topLeftMapNav.visible = false
		topLeftDrawerNav.visible = false
		if portraitPart3D != null:
			portraitPart3D.visible = false
		if letterRiddle != null:
			letterRiddle.visible = false
		if bookRiddle != null:
			bookRiddle.visible = false
		topLeftNav.visible = true
		var tmpNode:Control = get_tree().root.get_node("MainScene/SubViewportContainer2/SubViewport/TopLeftNav/Panel/Drawer")
		if tmpNode != null:
			sceneName = "captain_topLeft"
		else:
			sceneName = "captain_topLeft_interaction_officeOpenDrawer"
			if personalFile3D != null:
				personalFile3D.visible = true
			if closetKey3D != null:
				closetKey3D.visible = true
	elif sceneID == 13:
		print("sceneID: ", sceneID)
		topLeftNav.visible = false
		if personalFile3D != null:
			personalFile3D.visible = false
		if closetKey3D != null:
			closetKey3D.visible = false
		if portraitPart3D != null:
			portraitPart3D.visible = false
		if bookRiddle != null:
			bookRiddle.visible =true
		topLeftBookNav.visible = true
	elif sceneID == 14:
		print("sceneID: ", sceneID)
		topLeftNav.visible = false
		if portraitPart3D != null:
			portraitPart3D.visible = false
		if letterRiddle != null:
			letterRiddle.visible =true
		topLeftDrawerNav.visible = true
	elif sceneID == 15:
		print("sceneID: ", sceneID)
		topLeftNav.visible = false
		if not sceneID in visitedScenes:
			visitedScenes.append(sceneID)
			dialogueSystem.filePath = "res://Assets/JSON/Dialogues/Scene1/MapOnDesk.json"
			dialogueSystem.dialogues = dialogueSystem.loadDialoguesFromJSON(dialogueSystem.filePath)
			dialogueSystem.currentIndex = 0
			dialogueSystem.updateDialogue()
			dialogueSystem.visible =true
			
		if personalFile3D != null:
			personalFile3D.visible = false
		if closetKey3D != null:
			closetKey3D.visible = false
		if portraitPart3D != null:
			portraitPart3D.visible = false
		topLeftMapNav.visible = true
	elif sceneID == 16:
		print("sceneID: ", sceneID)
		if not inventorySystem.isInventoryUsed:
			button.visible = false
			inventorySystem.isInventoryUsed = false
		topLeftDrawerNav.visible = false
		topLeftNav.visible = true
		var tmpNode: Control = get_tree().root.get_node("MainScene/SubViewportContainer2/SubViewport/TopLeftNav/Panel/Drawer")
		if tmpNode != null:
			tmpNode.queue_free()
		#TODO: When reached certain dialogue or task
		#if personalFile3D != null:
		#	personalFile3D.visible = true
		if closetKey3D != null:
			closetKey3D.visible = true
		if portraitPart3D != null:
			portraitPart3D.visible = false
	elif sceneID == 17:
		print("sceneID: ", sceneID)
		if personalFile3D != null:
			personalFile3D.visible = false
		if closetKey3D != null:
			closetKey3D.visible = false
		if portraitPart3D != null:
			portraitPart3D.visible = false
		topLeftRadioNav.visible = true
		topLeftNav.visible = false
	elif sceneID == 18 :
		print("sceneID: ", sceneID)
		inventorySystem.isInventoryUsed = false
		mainNav.visible = false
		topRightGlobusNav.visible = false
		topRightGlobusOpenNav.visible = false
		if portraitPart3D != null:
			portraitPart3D.visible = false
		var openWardrobe: Control = get_tree().root.get_node("MainScene/SubViewportContainer2/SubViewport/TopRightNav/Panel/OpenWardrobe")
		if openWardrobe != null:
			sceneName = "captain_topRight"
			if inventorySystem.findItemInInventory("Closet Key") != "":
				openWardrobe.visible = true
			else:
				openWardrobe.visible = false
		if inventorySystem.findItemInInventory("Plush") != "":
			sceneName = "captain_main_interaction_wardrobeOpen"
		else:
			var tmpNode:Control = get_tree().root.get_node("MainScene/SubViewportContainer2/SubViewport/TopRightNav/Panel/OpenWardrobe")
			tmpNode.button.visible = true
		topRightNav.visible = true
	elif sceneID == 19:
		print("sceneID: ", sceneID)
	elif sceneID == 20:
		print("sceneID: ", sceneID)
	elif sceneID == 21:
		print("sceneID: ", sceneID)
	elif sceneID == 22:
		print("sceneID: ", sceneID)
	elif sceneID == 23:
		print("sceneID: ", sceneID)
	elif sceneID == 24:
		print("sceneID: ", sceneID)
		dininghall01Nav.visible = true
		if chair3D != null:
			chair3D.visible = true
		#TODO: change maybe later
		rightDoorOpenNav.visible = false
		dininghall03Nav.visible = false
		dininghall02Nav.visible = false
		interactionMeridith.visible = false
		interactionCrazyGuy.visible = false
	elif sceneID == 25:
		print("sceneID: ", sceneID)
		dininghall02Nav.visible = true
		interactionMeridith.visible = true
		if chair3D != null:
			chair3D.visible = false
		if seahoundStatue3D != null:
			seahoundStatue3D.visible = false
		dininghall01Nav.visible = false
		dininghall03Nav.visible = false
		dininghall04Nav.visible = false
		dininghall05Nav.visible = false
		interactionCrazyGuy.visible = false
	elif sceneID == 26:
		print("sceneID: ", sceneID)
	elif sceneID == 27:
		print("sceneID: ", sceneID)
		dininghall03Nav.visible = true
		interactionCrazyGuy.visible = true
		if chair3D != null:
			chair3D.visible = false
		dininghall01Nav.visible = false
	elif sceneID == 28:
		print("sceneID: ", sceneID)
		dininghall04Nav.visible = true
		dininghall02Nav.visible = false
		interactionMeridith.visible = false
	elif sceneID == 29:
		print("sceneID: ", sceneID)
	elif sceneID == 30:
		print("sceneID: ", sceneID)
		dininghall05Nav.visible = true
		if seahoundStatue3D != null:
			seahoundStatue3D.visible = true
		dininghall02Nav.visible = false
		interactionMeridith.visible = false
	elif sceneID == 31:
		print("sceneID: ", sceneID)
	else:
		print("nothing")
	background.swapBackground(GameManager.getSceneTexture(sceneName))
