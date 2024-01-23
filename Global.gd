extends Node


var is_multiplayer = false
var torpedo_speed = 30
var ai_aim_deadzone = deg_to_rad(4)


func mod(a, b):
    if a >= 0:
        return fmod(a, b)
    else:
        return fmod(fmod(a, b) + b, b)
