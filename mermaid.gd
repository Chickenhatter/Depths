extends CharacterBody2D
var everything = false
@onready var player = $"../../../Node2D/Player"
var unshot = true
func _physics_process(_delta):
	if everything == true:
		look_at(player.global_position)
		if unshot == true:
			$"../Node2D/Path2D".position = $".".position
			$"../Node2D/Path2D".rotation = $".".rotation
		else:
			$"../Node2D/Path2D/PathFollow2D".progress += 10
			$"../Node2D/Path2D/PathFollow2D/Sprite2D".rotation += 1
			if $"../Node2D/Path2D/PathFollow2D".progress == 1:
				$"../Node2D/Path2D".rotation = $".".rotation


func _on_shooted_area_entered(area: Area2D) -> void:
	if area.name == 'Shootmove':
		$"../Node2D/Path2D".rotation = $".".rotation
		unshot = false


func _on_starfish_escape_area_exited(area: Area2D) -> void:
	if area.name == 'StarfishBullet':
		print("lol")
		unshot = true
		$"../Node2D/Path2D/PathFollow2D".progress = 0.0001
		$"../Node2D/Path2D".rotation = $".".rotation


func _on_activator_body_entered(body: Node2D) -> void:
	if body.name == 'Player':
		everything = true
		$"../Node2D/Path2D".rotation = $".".rotation


func _on_activator_body_exited(body: Node2D) -> void:
	if body.name == 'Player':
		everything = false
		$"../Node2D/Path2D".rotation = $".".rotation
		
