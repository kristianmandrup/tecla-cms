class Config::Loader
  attr_reader :store

  def initialize file
    @file = file
  end

  def store
    @store ||= {}
  end

  def config
    @folder ||= File.join(Rails.root, 'config')
  end

  def yaml_file
    File.join config, file
  end

  def load
    begin
      store[file] = YAML.load File.open(yaml_file)
    rescue Error => e
      throw "Could not parse config file #{file}: #{e.message}"
    end
  end
end