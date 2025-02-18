extends Control
class_name InventorySystem

var inventory = []
var background : BackgroundTexture
var isInventoryUsed = false
@onready var itemSlotsRef = $Background/ItemSlots
@export var audioStreamPlayer:AudioStreamPlayer
@export var sound:AudioStream

func _ready():
	if sound != null:
		audioStreamPlayer.stream = sound
	background = get_tree().root.get_node("MainScene/SubViewportContainer/SubViewport/Background")
	self.mouse_filter = Control.MOUSE_FILTER_IGNORE
	for pickup_item in get_tree().get_nodes_in_group("pickup_items"):
		pickup_item.connect("itemPickedUp", Callable(self, "_on_item_picked_up"))

func addItem(itemName: String, itemIcon: Texture2D):
	inventory.append({"name": itemName, "icon": itemIcon})
	updateInventoryUI()
	
func removeItem(itemName: String, itemIcon: Texture2D):
	inventory.erase({"name": itemName, "icon": itemIcon})
	updateInventoryUI()

func updateInventoryUI():
	clearChildren(itemSlotsRef)

	for item in inventory:
	
		var itemSlot: Button  = Button.new()
		itemSlot.icon = item["icon"]
		var emptyStyle = StyleBoxEmpty.new()
		itemSlot.add_theme_stylebox_override("normal", emptyStyle)
		itemSlot.add_theme_stylebox_override("normal_mirrored", emptyStyle)
		itemSlot.add_theme_stylebox_override("hover", emptyStyle)
		itemSlot.add_theme_stylebox_override("hover_mirrored", emptyStyle)
		itemSlot.add_theme_stylebox_override("hover_pressed", emptyStyle)
		itemSlot.add_theme_stylebox_override("hover_pressed_mirrored", emptyStyle)
		itemSlot.add_theme_stylebox_override("pressed", emptyStyle)
		itemSlot.add_theme_stylebox_override("pressed_mirrored", emptyStyle)
		itemSlot.add_theme_stylebox_override("disabled", emptyStyle)
		itemSlot.add_theme_stylebox_override("disabled_mirrored", emptyStyle)
		itemSlot.add_theme_stylebox_override("focus", emptyStyle)
		
		itemSlot.connect("pressed", Callable(self, "_on_item_slot_pressed").bind(item["name"]))
		itemSlotsRef.add_child(itemSlot)

func clearChildren(container: Node):
	for child in container.get_children():
		child.queue_free()

func _on_item_picked_up(itemName: String, itemIcon: Texture2D):
	if findItemInInventory(itemName) == "":
		addItem(itemName, itemIcon)
	if findItemInInventory("Chair Piece") != "" and findItemInInventory("Knife") != "":
		var new_texture = load("res://Assets/Art/Placeholder/UI/icon.svg") as Texture2D
		removeItem("Chair Piece", new_texture)
		removeItem("Knife", new_texture)
		itemIcon = ResourceLoader.load("res://Assets/Art/Finished/2DAssets/Item pngs/Items_64x64/Holzdelphin_64.png")
		addItem("Wood Dolphine Statue", itemIcon)
		

func setInteractive(isInteractive: bool):
	self.mouse_filter = Control.MOUSE_FILTER_PASS if isInteractive else Control.MOUSE_FILTER_IGNORE

func findItemInInventory(itemName: String) -> String:
	for item in inventory:
		if item["name"] == itemName:
			return item["name"]
	return ""

func _on_item_slot_pressed(itemName: String):
	print("Item pressed:", itemName)
	if(itemName == "Notebook"):
		if sound != null:
			audioStreamPlayer.play()
		isInventoryUsed = true
		SceneManager.switchScene("captain_left_interaction_notebookCode", 5, null)
		#background.swapBackground(GameManager.getSceneTexture("captain_left_interaction_notebookCode"))
