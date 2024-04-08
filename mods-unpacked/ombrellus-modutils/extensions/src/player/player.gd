extends "res://src/player/player.gd"

@onready var utils = get_node("/root/ModLoader/ombrellus-modutils")

var doneSetUp:bool = false

func _ready():
	super._ready()

func updateChar(foward:=true):
	super.updateChar(foward)
	if not doneSetUp:
		for x in utils.customCharacters:
			if x.pos == Players.details[playerCharIndex].char:
				behavior = Utils.spawn(load("res://mods-unpacked/"+Players.details[playerCharIndex].charMod+"/extensions/src/character/"+Players.details[playerCharIndex].charInt+"/"+Players.details[playerCharIndex].charInt+".scn"), Vector2.ZERO, self)
		doneSetUp = true
