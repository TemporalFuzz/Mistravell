extends Node2D
onready var card_data = get_node("/root/card_data").card_data;

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var health = 25;
var ephemera = 0;
var ephemera_cap = 0;
var deck = [
	
];
var hand = [
	
];



# Called when the node enters the scene tree for the first time.
func shuffle_deck():
	deck.shuffle();

func draw_cards(count):
	if deck.size() == 0:
		return;

func start_turn():
	ephemera_cap += 1;
	ephemera = ephemera_cap;

func draw_card(id):
	
	pass

func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
