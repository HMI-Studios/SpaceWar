extends Node2D


func _ready():
    pass


func _on_player_1_died():
    %Timer.start()
    await %Timer.timeout
    get_tree().change_scene_to_file("res://Player2Win.tscn")
    


func _on_player_2_died():
    %Timer.start()
    await %Timer.timeout
    get_tree().change_scene_to_file("res://Player1Win.tscn")
