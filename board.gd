extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const Tile = preload("res://tile.tscn");
const TILE_SPACING = 120;
const BOARD_WIDTH = 5;
const BOARD_HEIGHT = 4;
const X_OFFSET = 0;
const Y_OFFSET = -50;
# Called when the node enters the scene tree for the first time.
func _ready():
	create();

func create():
	for _x in range(0, BOARD_WIDTH):
		for _y in range(0, BOARD_HEIGHT):
			var _new_tile = Tile.instance();
			_new_tile.position.x = _x * TILE_SPACING - (TILE_SPACING * (BOARD_WIDTH - 1)/2) + X_OFFSET;
			_new_tile.position.y = _y * TILE_SPACING - (TILE_SPACING * (BOARD_HEIGHT - 1)/2) + Y_OFFSET;
			add_child(_new_tile);

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
