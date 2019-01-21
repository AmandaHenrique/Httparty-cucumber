require 'cucumber'
require 'httparty'
require 'rspec'
require 'httparty/request'
require 'httparty/response/headers'
require_relative 'page_helper.rb'
require_relative '../service/contatos_service.rb'


World(PageObject)
World(ContatosService)

