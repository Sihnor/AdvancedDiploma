extends Node

# Path to the JSON file (editable in the Inspector)
var jsonFilePath: String = "res://scenes/JSON/gameScenes.json"
var background: BackgroundTexture

# Dictionary to store the mappings of scene names to their textures
var sceneTextures: Dictionary = {}

func _ready():
	#print(get_tree().root.get_node("MainScene/SubViewportContainer/SubViewport/Background").name)  # This should print the name of the active scene
	# Check if the background node exists in the specific path
	background = get_tree().root.get_node("MainScene/SubViewportContainer/SubViewport/Background")

	# If the background node is found, print a message
	if background:
		print("Background node found:", background)
	else:
		print("Background node not found!")
	
	# Load textures from the JSON file at the specified path
	loadSceneTexturesFromFile(jsonFilePath)
	# Print all loaded scenes and their textures (for debugging)
	for sceneName in sceneTextures.keys():
		print("Scene:", sceneName, "Texture:", sceneTextures[sceneName])
	# Example usage: Retrieve a texture for a specific scene
	var sceneName = "captain_main"  # Example scene name
	var texture = getSceneTexture(sceneName)
	if texture:
		print("Loaded texture for scene:", sceneName, "Texture:", sceneTextures[sceneName])
		background.swapBackground(texture)
	else:
		print("No texture found for scene:", sceneName)

# Function to get the texture for a given scene name
func getSceneTexture(sceneName: String) -> CompressedTexture2D:
	if sceneTextures.has(sceneName):
		return sceneTextures[sceneName] as CompressedTexture2D
	else:
		print("Scene name not found in dictionary:", sceneName)
		return null

# Function to load textures from a JSON file
func loadSceneTexturesFromFile(filePath: String) -> void:
	# Open the JSON file for reading
	var file = FileAccess.open(filePath, FileAccess.READ)
	if file:
		# Read the file content as a string
		var jsonText = file.get_as_text()
		
		# Parse the JSON content
		var json = JSON.new()
		var parseResult = json.parse(jsonText)

		if parseResult == OK:
			# Access the parsed JSON data
			var data = json.data
			for sceneName in data.keys():
				# Load the texture from the file path specified in the JSON
				var texturePath = data[sceneName]
				var texture = load(texturePath) as Texture2D
				if texture:
					# Add the texture to the dictionary with the scene name as the key
					sceneTextures[sceneName] = texture
				else:
					print("Error loading texture at path:", texturePath)
		else:
			print("Error parsing JSON:", parseResult)
	else:
		print("Error opening file at path:", filePath)
