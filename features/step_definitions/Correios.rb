# encoding: utf-8

# Cenario 1

Dado(/^o CEP "([^"]*)"$/) do |dadoBusca|  
	@Cep = dadoBusca
	end                                                                          
                                                                             
Quando(/^a busca no site do correio for efetuada$/) do                       
    @navegador = Selenium::WebDriver.for :firefox
	@navegador.manage.window.maximize
	@navegador.manage.timeouts.implicit_wait = 5
	@correio = 'http://correiosapi.apphb.com/cep/'+@Cep
end                                                                          
                                                                             
Quando(/^o CEP for valido$/) do                                              
	@navegador.get @correio
end                                                                          
                                                                             
Entao(/^o sistema devera retornar os dados do CEP informado$/) do            
	@navegador.find_element(:id, 'tab-0').click
	cepValido = @navegador.find_element(:css, 'html.theme-light body div#content div.tabs div.panels div#panel-0.tab-panel-box div.tab-panel div.jsonPanelBox div.panelContent table.treeTable tbody tr.treeRow.stringRow td.treeValueCell.stringCell span span.objectBox.objectBox-string').text
	expect(cepValido)==(@Cep)
end  

# Cenario 2

Dado(/^CEP "([^"]*)"$/) do |dadoBusca2|
	@cepBusca = dadoBusca2
end
Quando(/^a busca for relizada no site$/) do                                  
  @navegador = Selenium::WebDriver.for :firefox
	@navegador.manage.window.maximize
	@navegador.manage.timeouts.implicit_wait = 5
end                                                                          

Quando(/^o CEP for invalido$/) do                                                                                                                    
	@correio = 'http://correiosapi.apphb.com/cep/'+@cepBusca
end                                                                          
                                                                             
Entao(/^o sistema devera retornar uma mensagem de erro$/) do                 
	@navegador.get @correio
end                                                                          