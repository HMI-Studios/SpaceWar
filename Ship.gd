extends CharacterBody2D


var Torpedo = preload('res://Torpedo.tscn')


@export var speed = 1.5
@export var turn_speed = 2
var shoot_cooldown_time = 30
var shoot_cooldown = 0
        
        
func fwd():
    velocity += Vector2(0, -speed).rotated(rotation)
    

func left(delta):
    rotation -= turn_speed * delta
    
    
func right(delta):
    rotation += turn_speed * delta
    
    
func shoot():
    if shoot_cooldown == 0:
        var torpedo = Torpedo.instantiate()
        torpedo.position = position + (Vector2(0, -1).rotated(rotation) * 30)
        torpedo.modulate = modulate
        torpedo.apply_impulse((Vector2(0, -1).rotated(rotation) * 180) + velocity)
        shoot_cooldown = shoot_cooldown_time
        get_node('/root/Game/Torpedos').add_child(torpedo)
        
        
func kill():
    print("game over")


func _physics_process(delta):
    if shoot_cooldown > 0:
        shoot_cooldown -= 1
    
    position += velocity * delta
    
    position.x = Global.mod(position.x, 960)
    position.y = Global.mod(position.y, 720)
    velocity -= velocity * 0.007
