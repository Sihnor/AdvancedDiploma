extends Control
class_name InventorySystem
# Inventory data
var inventory = []

# Nodes
@onready var itemSlotsRef = $Background/ItemSlots

func _ready():
	# Ensure the UI doesn't block mouse input
	self.mouse_filter = Control.MOUSE_FILTER_IGNORE
	# Connect all PickupItems in the "pickup_items" group
	for pickup_item in get_tree().get_nodes_in_group("pickup_items"):
		pickup_item.connect("itemPickedUp", Callable(self, "_on_item_picked_up"))

# Method to add an item to the inventory
func addItem(itemName: String, itemIcon: Texture2D):
	inventory.append({"name": itemName, "icon": itemIcon})
	updateInventoryUI()

# Update the inventory UI with new items
func updateInventoryUI():
	# Clear all previous item slots
	clearChildren(itemSlotsRef)
	# Populate inventory UI with new items
	for item in inventory:
		var itemSlot = TextureRect.new()
		itemSlot.texture = item["icon"]
		itemSlot.stretch_mode = TextureRect.StretchMode.STRETCH_KEEP_ASPECT
		itemSlotsRef.add_child(itemSlot)

# Helper to clear all children (used for GridContainer in the UI)
func clearChildren(container: Node):
	for child in container.get_children():
		child.queue_free()

func _on_item_picked_up(itemName: String, itemIcon: Texture2D):
	addItem(itemName, itemIcon)  # Add item to inventory

# Enable or disable inventory interaction dynamically
func setInteractive(isInteractive: bool):
	self.mouse_filter = Control.MOUSE_FILTER_PASS if isInteractive else Control.MOUSE_FILTER_IGNORE
