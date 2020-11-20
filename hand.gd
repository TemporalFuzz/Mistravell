extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var selected_child;
const HIGH_Z_INDEX = 2;
const LOW_Z_INDEX = 1;
const Card = preload("res://card.tscn");


# Called when the node enters the scene tree for the first time.
func tether_x(index, size):
	return index * 75 - (size - 1) * 75/2;

func tether_y(index, size):
	 return -50 + abs(index - size/2 + 0.5) * 15

func tether_angle(index, size):
	return (index - size/2 + 0.5) * 30/size;

func _ready():
	for _i in range(0, 6):
		var _new = Card.instance();
		_new.setup("hydra_mite");
		add_child(_new);
	
	var _size = get_children().size();
	for _i in get_children():
		var _index = _i.get_index();
		_i.tether_x = tether_x(_index, _size);
		_i.tether_y = tether_y(_index, _size);
		_i.tether_angle = tether_angle(_index, _size);

func _process(delta):
	if selected_child:
		selected_child.interpolate_to({
			factor = 0.3,
			scale_x = 2.0,
			scale_y = 2.8,
			rotation = 0
		});
		if not Input.is_mouse_button_pressed(BUTTON_LEFT) and not selected_child.mouse_over:
			selected_child.selected = false;
			selected_child.z_index = LOW_Z_INDEX;
			selected_child = null;
		elif Input.is_mouse_button_pressed(BUTTON_LEFT):
			var _mouse = get_global_mouse_position()
			selected_child.interpolate_to({
				factor = 0.5,
				position_x = _mouse.x - position.x,
				position_y = _mouse.y - position.y,
			});
		#else:
			#selected_child.interpolate_to({
			#	factor = 0.5,
			#	position_y = -120,
			#});
			# selected_child.position.x += (_mouse.x - position.x - selected_child.position.x) * 0.5;
			# selected_child.position.y += (_mouse.y - position.y - selected_child.position.y) * 0.5;
	for _child in get_children():
		if !selected_child and _child.mouse_over:
			selected_child = _child;
			selected_child.selected = true;
			selected_child.z_index = HIGH_Z_INDEX;
		if selected_child != _child:
			_child.interpolate_to({
				factor = 0.3,
				position_x = _child.tether_x,
				position_y = _child.tether_y,
			});
		elif not Input.is_mouse_button_pressed(BUTTON_LEFT):
			_child.interpolate_to({
				factor = 0.3,
				position_x = _child.tether_x,
				position_y = -85,
			});
		if selected_child != _child:
			_child.interpolate_to({
				factor = 0.3,
				scale_x = 1.4,
				scale_y = 2.1,
				rotation = _child.tether_angle,
			});


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
