World(BuscarProdutoScreen)

Dado(/^que eu acesso o site do Zé delivery$/) do
  site = "https://www.ze.delivery/"
  visit site
end

Quando(/^preencho as informações necessárias para buscar pelo produto "([^"]*)"$/) do |produto|
  verifica_idade()
  preencher_endereco('Av. Paulista', '77', 'Ap. 55')
  buscar_produto(produto)
  
end

Então(/^seleciono o produto informando a quantidade "([^"]*)" e confirmo a compra$/) do |quantidade|
  selecionar_produto(quantidade)
end

