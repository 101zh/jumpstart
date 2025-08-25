extends Control

const pathToLevels : String = "res://scenes/Levels/"
var enemies : int = 0;
@export var bullet_count : int;
@onready var bullet_number: Label = $"../BulletNumber"

func _init() -> void:
	GameManager.enemyCount.connect(addToEnemyCount)
	GameManager.enemyDeath.connect(onEnemyDeath)
	
func _ready() -> void:
	GameManager.bullets = bullet_count
	
func _process(delta: float) -> void:
	bullet_number.text = str(GameManager.bullets)

func _on_next_level_button_down() -> void:
	var levelNumber : int = int(get_tree().current_scene.scene_file_path.substr(get_tree().current_scene.scene_file_path.length()-6, 1))
	GameManager.change_scene_to_file(pathToLevels+str(levelNumber+1)+".tscn")

func _on_main_menu_button_down() -> void:
	GameManager.change_scene_to_file("res://gameobjects/MainMenu.tscn")
	
func _on_quit_button_down() -> void:
	get_tree().quit()
	
func addToEnemyCount() -> void:
	enemies += 1
	
func onEnemyDeath() -> void:
	enemies -= 1
	if enemies <= 0:
		show()
