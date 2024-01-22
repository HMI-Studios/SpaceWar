extends Node

var is_multiplayer = false


func mod(a, b):
    if a >= 0:
        return fmod(a, b)
    else:
        return fmod(fmod(a, b) + b, b)
