extends "Ship.gd"


func _physics_process(delta):
    if Input.is_action_pressed("player_1_fwd"):
        fwd()
    if Input.is_action_pressed("player_1_left"):
        left(delta)
    if Input.is_action_pressed("player_1_right"):
        right(delta)
    if Input.is_action_pressed("player_1_shoot"):
        shoot()
    
    super._physics_process(delta)
