extends "Ship.gd"


func aim_for(delta, pos):
    var diff = pos - position
    var theta_diff = fmod((atan2(diff.y, diff.x) + PI/2 - rotation) + PI, PI*2) - PI
    if theta_diff > Global.ai_aim_deadzone:
        right(delta)
        return false
    elif theta_diff < -Global.ai_aim_deadzone:
        left(delta)
        return false
    else:
        return true


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
        if %Player1:
            var diff = %Player1.position - position
            var time_distance = diff.length() / Global.torpedo_speed
            var aim_pos = %Player1.position + (%Player1.velocity * time_distance * (delta * 6))
            if time_distance < 8:
                aim_for(delta, position - diff)
                fwd()
            else:
                var on_target = aim_for(delta, aim_pos)
                if time_distance > 16:
                    fwd()
                if on_target:
                    shoot()
    
    super._physics_process(delta)
