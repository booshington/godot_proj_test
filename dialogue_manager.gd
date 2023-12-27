extends Control

@export var _dialogue_text: Label
@export var _avatar: TextureRect
@export var _dialogue_resource: Dialogue


func _ready():
	_dialogue_text.text = _dialogue_resource.dialogue_slides[0]
	_avatar.texture = _dialogue_resource.avatar_texture
	
