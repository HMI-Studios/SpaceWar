extends TextureButton


func _ready():
    modulate = Color(1, 1, 1, 1)


func _on_mouse_entered():
    modulate = Color(1, 1, 1, 0.8)

func _on_mouse_exited():
    modulate = Color(1, 1, 1, 1)


func _on_button_down():
    modulate = Color(1, 1, 1, 0.6)
