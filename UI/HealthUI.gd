extends Control

var hearts = 4 setget set_hearts
var max_heart = 4 setget set_max_hearts

onready var heartUIFull = $HeartUIFull
onready var heartUIEmpty = $HeartUIEmpty


func set_hearts(value):
	hearts = clamp(value,0,max_heart)
	if heartUIFull != null:
		heartUIFull.rect_size.x = hearts * 15

func set_max_hearts(value):
	max_heart = max(value,1)
	self.hearts = min(hearts, max_heart)
	if heartUIEmpty != null:
		heartUIEmpty.rect_size.x = max_heart * 15

func _ready():
	self.max_heart = PlayerStats.max_health
	self.hearts = PlayerStats.health
	PlayerStats.connect("health_change",self,"set_hearts")
	PlayerStats.connect("max_health_changed",self,"set_max_hearts")
