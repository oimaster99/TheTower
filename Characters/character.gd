extends CharacterBody2D


@onready var _focus = $Focus
@onready var prog_bar = $ProgressBar
@onready var animation_player = $AnimationPlayer

@export var MAX_HEALTH: float
@export var ATTACK: float
@export var DEFENSE: float
@export var SPEED: float

var health: float:
	set(value):
		health = value
		_update_progress_bar()
		_play_animation()
		
func _ready():
	health = MAX_HEALTH
		
func _update_progress_bar():
	prog_bar.value = (health/MAX_HEALTH) * 100
	
func _play_animation():
	animation_player.play("hurt")
	
func focus():
	_focus.show()

func unfocus():
	_focus.hide()
	
func take_damage(value):
	value -= (DEFENSE * 0.5)
	health -= value
