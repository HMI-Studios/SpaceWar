extends RigidBody2D


@onready var lifetime = randi_range(150, 170)


func _integrate_forces(delta):
    if position.x < 0 or position.x > 960:
        PhysicsServer2D.body_set_state(
            get_rid(),
            PhysicsServer2D.BODY_STATE_TRANSFORM,
            Transform2D.IDENTITY.rotated(rotation).translated(Vector2(Global.mod(position.x, 960), position.y))
        )
    if position.y < 0 or position.y > 720:
        PhysicsServer2D.body_set_state(
            get_rid(),
            PhysicsServer2D.BODY_STATE_TRANSFORM,
            Transform2D.IDENTITY.rotated(rotation).translated(Vector2(position.x, Global.mod(position.y, 720)))
        )
        
    lifetime -= 1
    if lifetime <= 0:
        call_deferred("free")
