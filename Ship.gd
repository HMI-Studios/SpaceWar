extends CharacterBody2D


@export var speed = 1.5
@export var turn_speed = 2


func mod(a, b):
    if a >= 0:
        return fmod(a, b)
    else:
        return fmod(fmod(a, b) + b, b)
        
        
func fwd():
    velocity += Vector2(0, -speed).rotated(rotation)
    

func left(delta):
    rotation -= turn_speed * delta
    
    
func right(delta):
    rotation += turn_speed * delta
    
    
func shoot():
    pass


func _physics_process(delta):
    position += velocity * delta
    
    position.x = mod(position.x, 960)
    position.y = mod(position.y, 720)
    velocity -= velocity * 0.007
