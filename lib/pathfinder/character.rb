require 'yaml'

module Pathfinder

  CHARACTERISTICS =%i(strength dexterity constitution intelligence wisdom charisma)

  class Character
    attr_reader :name, :level, :feats, :traits, :skills, :caste, :archetype, :race, :hit_points, :movement

    def initialize(attrs = {})
      @name = attrs.fetch('name') { nil }
      @race = attrs.fetch('race') { 'Human' }
      @caste = attrs.fetch('class') { 'Warrior' }
      @archetype = attrs.fetch('archetype') { '' }
      @level = attrs.fetch('level') { 1 }
      @hit_points = attrs.fetch('HP') { 1 }
      @movement = attrs.fetch('movement') { '9m' }

      @characteristics = attrs.fetch('characteristics') { {} }

      @abilities = attrs.fetch('abilities') { {} }

      @traits = attrs.fetch('traits') { [] }

      @feats = attrs.fetch('feats') { [] }

      @spells = attrs.fetch('spells') { {} }

      @skills = attrs.fetch('skills') { {} }

      @saving_throws = attrs.fetch('saving_throws') { {} }

      @combat = attrs.fetch('combat') { {} }

      @languages = attrs.fetch('languages') { [] }
    end

    CHARACTERISTICS.each do |characteristic|
      define_method characteristic do
        @characteristics[characteristic[0..2]]
      end
    end

    %i(racial class).each do |type|
      define_method "#{type}_abilities" do
        @abilities.fetch(type) { [] }
      end
    end

    %i(quickness toughness willpower).each do |saving_throw|
      define_method saving_throw do
        @saving_throws.fetch('quickness') { 0 }
      end
    end

    def spellbook
      @spells.fetch('book') { {} }
    end

    def prepared_spells_per_day
      @spells.fetch('prepared') { {} }
    end

    def spells_cast_per_day
      @spells.fetch('per_day') { {} }
    end

    def self.from_yaml(yaml)
      character_info = YAML.load(yaml) || {}
      self.new(character_info)
    end
  end
end
