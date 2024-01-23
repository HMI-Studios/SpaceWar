extends "Ship.gd"


func _physics_process(delta):
    if Global.is_multiplayer:
        if Input.is_action_pressed("player_2_fwd"):
            fwd()
        if Input.is_action_pressed("player_2_left"):
            left(delta)
        if Input.is_action_pressed("player_2_right"):
            right(delta)
        if Input.is_action_pressed("player_2_shoot"):
            shoot()
    else:
        pass
    
    super._physics_process(delta)
