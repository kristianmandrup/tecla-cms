class Config::Loader
  def initialize file
    @file = file
  end

  def config
    @folder ||= File.join(Rails.root, 'config')
  end

  def yaml_file
    File.join config, file
  end

  def load
    parsed = begin
      YAML.load(File.open(yaml_file))[name || model]
    rescue ArgumentError => e
      puts "Could not parse YAML: #{e.message}"
    end
  end

end