Dado("que estou na Api de contatos") do
 ##já esta setado a url padrao, a outra parte da url
 # eu chamo na propria chamada do metodo dentro das pages
end

#GET

Quando("eu realizar uma requisicao de consulta na Api com um {int}") do |id|                                                                      
    @get = contatos.get(id)
    puts @get.code
    puts @get.message
end                                                                      
                                                                            
Entao("me retonar o codigo {int} e a {string}") do |codigo, mensagem|         
    expect(@get.code).to eql codigo
    expect(@get.message).to eql mensagem
end                                                                      


#POST

Quando("eu realizar uma requisição para cadastrar um contato com os parametros {string} {string} {string} {string} {string} {string} {string} {string}") do |name, last_name, email, age, phone, address, state, city|
    @post = contatos.post(name, last_name, email, age, phone, address, state, city)
    #puts @post
    #puts @post.body
end

Entao("me retornar os valores cadastrados com um id") do
    @notnull = @post.parsed_response['data']['id']
    #convertendo para o formato json, caso venha uma string#
    puts @notnull
    expect(@notnull).not_to be_nil 

end

Entao("me retornar a mensagem {string} {int}") do |mensagem, code|
    expect(@post.code).to eql code
    expect(@post.message).to eql mensagem
end


#PUT/PACTH

Quando("eu realizar uma atualização para o id {int} com os novos valores {string} {string}") do |id, name, address|
    @patch = contatos.patch(id, name, address)
    puts @patch
end

Entao("verificar o {int} e a {string}") do |codigo, mensagem|                  
    expect(@patch.code).to eql codigo    
    expect(@patch.message).to eql mensagem
end                                                                                                                                      
                                                                            
  
  

#DELETE

Quando("eu realizar uma requisicao de delete passando o {int}") do |id|
    @delete = contatos.delete(id)
end
  
Quando("me retornar o {int} e {string} de sucesso na remocao") do |codigo, mensagem|
    puts @delete.code
    puts @delete.message
    expect(@delete.code).to eql codigo
    expect(@delete.message).to eql mensagem
end
  
Entao("consultar o mesmo {int} para ver se realmente foi deletado") do |id|
    @response = contatos.get(id)
end

Entao("obter o resultado {int} {string}") do |codigo, mensagem|
    puts @response.code
    puts @response.message
    expect(@response.code).to eql codigo
    expect(@response.message).to eql mensagem 
end