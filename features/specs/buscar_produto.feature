# language: pt

Funcionalidade: Buscar produto

	Contexto: Acessar site
		Dado que eu acesso o site do Zé delivery

	Cenário: Buscar produto
		Quando preencho as informações necessárias para buscar pelo produto "Skol"
		Então seleciono o produto informando a quantidade "15" e confirmo a compra