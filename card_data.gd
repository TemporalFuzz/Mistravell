extends Node2D

func scope_self(origin, check):
	return origin == check;

func trigger_self_p1p1(origin):
	print("buff")

var ref_trigger_self_p1p1 = funcref(self, "trigger_self_p1p1");

func trigger_self_attack(origin):
	print("attack")

var ref_trigger_self_attack = funcref(self, "trigger_self_attack");
	

var keywords = {
	"enrage": {
		type = "triggered",
		scope = "self",
		trigger = "attack",
		effect = ref_trigger_self_p1p1,
	},
	"frenzy": {
		type = "triggered",
		trigger = "kill",
		scope = "self",
		effect = ref_trigger_self_attack,
	},
};



var card_data = {
	"basic": {
		name = "Basic",
		type = "unit",
		cost = 0,
		attack = 0,
		health = 0,
		text = "",
		abilities = [
			
		],
	},
	"hydra_mite": {
		name = "Mite",
		type = "unit",
		cost = 1,
		attack = 1,
		health = 1,
		text = "Enrage",
		abilities = [
			keywords.enrage
		]
	},
};

func _ready():
	print(self.get_path())
