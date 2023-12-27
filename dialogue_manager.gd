extends Control

@export var _dialogue_text: Label
@export var _avatar: TextureRect
@export var _dialogue_resource: Dialogue

var curr_slide_index := 0

func _ready():
	show_slide()

	
func _input(event):
	if Input.is_action_just_pressed("advance_slide"):
		if curr_slide_index < (_dialogue_resource.dialogue_slides.size() - 1):
			curr_slide_index += 1
			show_slide()
		else:
			visible = false

func show_slide():
	_dialogue_text.text = _dialogue_resource.dialogue_slides[curr_slide_index]
	_avatar.texture = _dialogue_resource.avatar_texture
