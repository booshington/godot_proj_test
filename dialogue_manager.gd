extends Control

@export var _dialogue_text: NodePath

func _ready():
	var _dialogue_text: Label = get_node(_dialogue_text)
	_dialogue_text.text = "welcome to the game!"
