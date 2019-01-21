Dir[File.join(File.dirname(__FILE__), '../pages/*_page.rb')].each {|file| require file}

module PageObject
    def contatos
        @contatos ||=ContatosPage.new
    end
end