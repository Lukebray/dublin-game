extends Area2D
class_name HurtboxComponent

signal hit(weapon_angle)


func _on_area_entered(area):
	hit.emit(area.global_rotation)
