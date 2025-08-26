extends Control

const pathToLevels : String = "res://scenes/Levels/"
var enemies : int = 0;
@export var bullet_count : int;
@onready var bullet_number: Label = $"../BulletNumber"
var crosshair = load("res://images/crosshair.png")
@onready var level_failed: Control = $LevelFailed
@onready var level_suceeded: Control = $LevelSuceeded

func _init() -> void:
	GameManager.enemyCount.connect(addToEnemyCount)
	GameManager.enemyDeath.connect(onEnemyDeath)
	GameManager.zeroBullets.connect(onZeroBullets)
	
func _ready() -> void:
	GameManager.pausable = true;
	GameManager.bullets = bullet_count
	
func _process(delta: float) -> void:
	bullet_number.text = str(GameManager.bullets)

func _on_next_level_button_down() -> void:
	var levelNumber : int = int(get_tree().current_scene.scene_file_path.substr(get_tree().current_scene.scene_file_path.length()-6, 1))
	if(levelNumber>=GameManager.level_count):
		GameManager.change_scene_to_file("res://gameobjects/EndingMenu.tscn")
	else:
		GameManager.change_scene_to_file(pathToLevels+str(levelNumber+1)+".tscn")

func _on_main_menu_button_down() -> void:
	GameManager.change_scene_to_file("res://gameobjects/MainMenu.tscn")
	
func _on_quit_button_down() -> void:
	get_tree().quit()
	
func _on_retry_button_down() -> void:
	get_tree().reload_current_scene()

func onZeroBullets() -> void:
	if GameManager.bullets <= 0 and enemies >= 1:
		await get_tree().create_timer(3, false, false, true).timeout
		if GameManager.bullets<=0 and enemies>=1:
			level_failed.show()
			GameManager.pausable = false

func addToEnemyCount() -> void:
	enemies += 1
	
func onEnemyDeath() -> void:
	enemies -= 1
	if enemies <= 0:
		level_suceeded.show()
		GameManager.pausable = false
