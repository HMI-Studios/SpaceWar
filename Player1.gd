extends "Ship.gd"


func _ready():
    pass # Replace with function body.


func _physics_process(delta):
    if Input.is_action_pressed("player_1_fwd"):
        fwd()
    if Input.is_action_pressed("player_1_left"):
        left(delta)
    if Input.is_action_pressed("player_1_right"):
        right(delta)
    
    super._physics_process(delta)
