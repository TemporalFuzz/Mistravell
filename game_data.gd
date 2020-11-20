extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.

var game_data = {
	player = {
		ephemera = 0,
		ephemera_cap = 0,
		deck = [
			"hydra_mite",
			"hydra_mite",
			"hydra_mite",
			"hydra_mite",
			"basic",
			"basic",
		],
	},
	enemy = {
		ephemera = 0,
		ephemera_cap = 0,
		deck = [],
	},
};




# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
