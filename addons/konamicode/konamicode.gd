extends Node
signal success

## Will it do the thing?
@export var active: bool = true

## What you want your code to be.
##[br]If left empty, it defaults to the Konami Code.
@export var code_override: Array[Key]

## If enabled the listener will disable itself
## once successfully triggered.
@export var fire_only_once: bool = false

## The default, the classic.
const KONAMI_CODE: Array[Key] = [
	KEY_UP, KEY_UP, KEY_DOWN, KEY_DOWN,
	KEY_LEFT, KEY_RIGHT, KEY_LEFT, KEY_RIGHT,
	KEY_A, KEY_B, KEY_ENTER 
]

var _relevant_code: Array[Key]
var _successful_presses: int = 0

func _ready() -> void:
	if len(code_override) > 0:
		_relevant_code = code_override
	else:
		_relevant_code = KONAMI_CODE

func _input(event: InputEvent) -> void:
	if !active:
		return
	
	if event is not InputEventKey:
		return
	
	if event.echo || !event.pressed:
		return

	_code_checker(event)

func _code_checker(event: InputEventKey) -> void:
	if _relevant_code[_successful_presses] == event.keycode:
		_successful_presses += 1
	else:
		_successful_presses = 0
	
	if len(_relevant_code) == _successful_presses:
		success.emit()
		_successful_presses = 0

		if fire_only_once:
			active = false

## Below are functions you can use to enable/disable
## the node, if you're the type that prefers doing
## that instead of going on properties directly.

func enable() -> void:
	active = true

func disable() -> void:
	active = false
