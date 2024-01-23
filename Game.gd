extends Node2D


var is_draw = false


func _ready():
    pass
    
    
func _physics_process(delta):
    if %Player1 and %Player2:
        var player_distance = (%Player1.position - %Player2.position).length()
        if player_distance < 15:
            %Player1.kill()
            %Player2.kill()
            is_draw = true
            %Timer.start()
            await %Timer.timeout
            get_tree().change_scene_to_file("res://Draw.tscn")


func _on_player_1_died():
    if is_draw: return
    %Timer.start()
    await %Timer.timeout
    get_tree().change_scene_to_file("res://Player2Win.tscn")
    


func _on_player_2_died():
    if is_draw: return
    %Timer.start()
    await %Timer.timeout
    get_tree().change_scene_to_file("res://Player1Win.tscn")
