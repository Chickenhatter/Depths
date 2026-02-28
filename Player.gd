extends CharacterBody2D
var camera = true
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var end = false
var qwerty = false

func _physics_process(delta: float) -> void:
	if end == false:
		$Player.play("Idol")
	qwerty = false
	var movement = Vector2.ZERO
	if Input.is_action_pressed("ui_w"):
		movement.y -= 1
		$Player.play("Idol")
		qwerty = true
	if Input.is_action_pressed("ui_a"):
		movement.x -= 1
		$Player.play("Idol")
		$Player.flip_h = false
		qwerty = true
	if Input.is_action_pressed("ui_s"):
		movement.y += 1
		$Player.play("Idol")
		qwerty = true
	if Input.is_action_pressed("ui_d"):
		movement.x += 1
		$Player.play("Idol")
		$Player.flip_h = true
		qwerty = true
	velocity = movement * 300
	if not is_on_floor():
		velocity += get_gravity() * delta * 5
	move_and_slide()
	if camera == true:
		$"../../Camera/Camera2D".position = $".".position
		$".".rotation = 0
	if end == true:
		$"../../../Timers/Node2D/Path2D/PathFollow2D".progress += 2
		$Player.play("Dead")
		qwerty = true
	if qwerty == false:
		$Player.play("Swim")


func _on_starfish_bullet_body_entered(body: Node2D) -> void:
	if body.name == 'Player':
		end = true
		$Sprite2D2.visible = not $Sprite2D2.visible 
		$AnimatedSprite2D2.play("Animated")


func _on_fly_fsh_body_entered(body: Node2D) -> void:
	if body.name == 'Player':
		end = true
		$Sprite2D2.visible = not $Sprite2D2.visible 
		$AnimatedSprite2D2.play("Animated")


func _on_sa_dwd_body_entered(body: Node2D) -> void:
	pass # Replace with function body.


func _on_sa_dwd_area_entered(area: Area2D) -> void:
	if area.name == 'LlL':
		get_tree().change_scene_to_file("res://Images/Fun/restart.tscn")


func _on_arewadawawdawwa_2d_body_entered(body: Node2D) -> void:
	if body.name == 'Player':
		get_tree().change_scene_to_file("res://Images/Fun/End.tscn")


func _on_swarjwekjdn_body_entered(body: Node2D) -> void:
	if body.name == 'Player':
		end = true
		$Sprite2D2.visible = not $Sprite2D2.visible 
		$AnimatedSprite2D2.play("Animated")
