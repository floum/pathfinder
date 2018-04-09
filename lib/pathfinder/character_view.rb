require 'haml'

module Pathfinder
  class CharacterView
    include I18n

    attr_reader :character, :language

    def initialize(attrs = {})
      @language = attrs.fetch(:language) { 'en' }
      @character = attrs.fetch(:character) { Character.new }
    end

    def render
      template = File.read("views/character.haml")
      Haml::Engine.new(template).render(self)
    end
  end
end
