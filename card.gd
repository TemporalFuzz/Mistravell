extends Node2D
onready var card_data = get_node("/root/card_data").card_data;

var mouse_over := false;
var selected := false;
var card_id = "";

var tether_x = 0;
var tether_y = 0;
var tether_angle = 0;

var ready = false;



# Called when the node enters the scene tree for the first time.
func _ready():
	if card_id:
		apply(card_id);
	pass # Replace with function body.

func _playable():
	pass

func interpolate_to(data):
	if "position_x" in data:
		if abs(data.position_x - position.x) < 1:
			position.x = data.position_x;
		else:
			position.x += (data.position_x - position.x) * data.factor;
	if "position_y" in data:
		if abs(data.position_y - position.y) < 1:
			position.y = data.position_y;
		else:
			position.y += (data.position_y - position.y) * data.factor;
	if "scale_x" in data:
		if abs(data.scale_x - scale.x) < 0.1:
			scale.x = data.scale_x;
		else:
			scale.x += (data.scale_x - scale.x) * data.factor;
	if "scale_y" in data:
		if abs(data.scale_y - scale.y) < 0.1:
			scale.y = data.scale_y;
		else:
			scale.y += (data.scale_y - scale.y) * data.factor;
	if "rotation" in data:
		if abs(data.rotation - rotation_degrees) < 1:
			rotation_degrees = data.rotation;
		else:
			rotation_degrees += (data.rotation - rotation_degrees) * data.factor;

func setup(new_card_id):
	if ready:
		apply(new_card_id);
	card_id = new_card_id;

func apply(new_card_id):
	card_id = new_card_id
	$"Name".text = card_data[card_id].name;
	$"Cost".text = str(card_data[card_id].cost);
	$"Attack".text = str(card_data[card_id].attack);
	$"Health".text = str(card_data[card_id].health);
	
	#template = template_name;
	#name = card_data[template_name].name;
	#cost = card_data[template.name].cost;
	#attack = card_data[template_name].attack;
	#health = card_data[template_name].health;
	#max_health = card_data[template_name].health;
	
	

#func set_stats(attack_value, health_value):
#	attack = attack_value;
#	max_health = health_value;
#	if health > max_health:
#		health = max_health;

#func change_stats(attack_change, health_change):
#	attack += attack_change;
#	max_health += health_change;

# warning-ignore:unused_argument
# warning-ignore:unused_argument
func _on_KinematicBody2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			selected = true;
		elif event.button_index == BUTTON_LEFT and !event.pressed:
			selected = false;
	get_tree().set_input_as_handled();


# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta):
	pass


func _on_KinematicBody2D_mouse_entered():
	mouse_over = true;

func _on_KinematicBody2D_mouse_exited():
	mouse_over = false;
