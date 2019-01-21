class ContatosPage

    def getAll
        ContatosService.get("/contacts")
    end

    def get(id)
        ContatosService.get("/contacts/#{id}")
    end

    def post(name, last_name, email, age, phone, address, state, city)
        @body = 
        {
            "name": "#{name}",
            "last_name": "#{last_name}",
            "email": "#{email}",
            "age": "#{age}",
            "phone": "#{phone}",
            "address": "#{address}",
            "state": "#{state}",
            "city": "#{city}"
        }.to_json

        ContatosService.post('/contacts', body: @body)
    end

    def patch(id, name, address)
        @body = 
        {
            "id": "#{id}",
            "name": "#{name}",
            "address": "#{address}"
        }.to_json
    
        ContatosService.patch("/contacts/#{id}", body: @body)
    end

    def delete(id)
        ContatosService.delete("/contacts/#{id}")
    end

end