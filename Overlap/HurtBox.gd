extends Area2D

const HitEffect = preload("res://Effects/HitEffect.tscn")

var invincible = false setget set_invicible

onready var timer = $Timer

signal invincibility_started
signal invincibility_end

func set_invicible(value):
	invincible = value
	if invincible == true:
		emit_signal("invincibility_started")
	else:
		emit_signal("invincibility_end")

func start_invincibility(duration):
	self.invincible = true
	timer.start(duration)

func create_hit_effect():
	var effect = HitEffect.instance()
	var main = get_tree().current_scene
	main.add_child(effect)
	effect.global_position = global_position

func _on_Timer_timeout():
	self.invincible = false


func _on_HurtBox_invincibility_started():
	set_deferred("monitorable",false)

func _on_HurtBox_invincibility_end():
	monitorable = true
