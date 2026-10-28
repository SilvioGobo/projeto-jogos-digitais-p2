extends CharacterBody2D

@export var velocidade: float = 40.0
var jogador: Node2D = null

func _ready() -> void:
	# O inimigo procura o jogador na cena assim que o jogo começa
	jogador = get_tree().get_first_node_in_group("jogador")
	print("O inimigo achou o alvo: ", jogador)

func _physics_process(_delta: float) -> void:
	if jogador:
		# Calcula a direção exata até o jogador e anda até ele
		var direcao = global_position.direction_to(jogador.global_position)
		velocity = direcao * velocidade
		move_and_slide()
