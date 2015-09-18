require 'yaml'

class ConcernsLoader
  require 'singleton'
  include Singleton

  attr_reader :model

  def initialize model
    @model = model
  end

  def config
    @folder ||= File.join(Rails.root, 'config')
  end

  def yaml_file
    File.join config, 'models.yml'
  end

  def load name
    parsed = begin
      YAML.load(File.open(yaml_file))[name || model]
    rescue ArgumentError => e
      puts "Could not parse YAML: #{e.message}"
    end
  end
end

