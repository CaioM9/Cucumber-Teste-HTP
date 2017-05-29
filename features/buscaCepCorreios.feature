# language: pt

Funcionalidade: efetuar a busca de um CEP no site do Correio
	Sendo que eu tenha a URL necessario para a busca
	Posso posso criar uma busca 
	 Para conseguir os dados do CEP informado
	
# Cenario 1

	Cenario: Validar a busca de um CEP valido
	   Dado o CEP "06381090"
     Quando a busca no site do correio for efetuada
		  E o CEP for valido
      Entao o sistema devera retornar os dados do CEP informado
	  
# Cenario 2

	Cenario: Validar a busca de um CEP invalido
	   Dado CEP "06381999"
     Quando a busca for relizada no site
		  E o CEP for invalido
      Entao o sistema devera retornar uma mensagem de erro