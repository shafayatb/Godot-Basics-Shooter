extends CanvasLayer

var green: Color = Color("6bbfa3")
var red: Color = Color(0.9, 0, 0, 1)

@onready var laser_label: Label = $LaserCounter/VBoxContainer/Label
@onready var grenade_lebel: Label = $GrenadeCounter/VBoxContainer/Label
@onready var laser_icon: TextureRect = $LaserCounter/VBoxContainer/TextureRect
@onready var grenade_icon: TextureRect = $GrenadeCounter/VBoxContainer/TextureRect

func _ready():
	update_laser_text()
	update_grenade_text()

func update_laser_text():
	laser_label.text = str(Globals.laser_amount)
	update_projectile_counter_color(Globals.laser_amount, laser_label, laser_icon)	
	
func update_grenade_text():
	grenade_lebel.text = str(Globals.grenade_amount)	
	update_projectile_counter_color(Globals.grenade_amount, grenade_lebel, grenade_icon)
		
func update_projectile_counter_color(amount: int, label: Label, icon: TextureRect):
	if amount > 0:
		label.modulate = green
		icon.modulate = green
	else:
		label.modulate = red
		icon.modulate = red	
