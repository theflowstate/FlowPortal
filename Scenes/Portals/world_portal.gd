extends Node3D
class_name WorldPortal

@export var linked_portal: WorldPortal
@export var active_cam: Camera3D

@onready var cam = $PortalMesh/SubViewport/Camera3D
@export var helper: Marker3D

func _ready():
	helper = $Helper

func _process(delta):
	
	cam.global_position = linked_portal.global_position + (active_cam.global_position - global_position).rotated(Vector3.UP, -rotation.y + linked_portal.rotation.y)
	cam.global_rotation = active_cam.global_rotation - rotation + linked_portal.rotation

