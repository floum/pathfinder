require 'yaml'

module Pathfinder
  module I18n
    def i18n(sym)
      dictionary = YAML.load(File.read('views/i18n.yaml'))
      dictionary.fetch(sym.to_s) { {} }.fetch(language) { sym }
    end
  end
end
