tool
extends Control

onready var title_panel = $TitlePanel
onready var switcher_btn = $ButtonContainer

export var demo_title: String
export var button_text: String
export var next_scene: String

func _ready():
	title_panel.get_child(0).text = demo_title
	switcher_btn.get_child(0).text = button_text
