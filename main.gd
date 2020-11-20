extends Node2D

# const Card = preload("res://card.tscn");
const Player = preload("res://player.tscn");
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var player;
var enemy;
# Called when the node enters the scene tree for the first time.
func _ready():
	player = Player.instance();
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
