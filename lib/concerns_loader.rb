require 'yaml'

class ConcernsLoader
  require 'singleton'
  include Singleton

  attr_reader :model

  def initialize model
    @model = model
  end

  def model_name
    model.to_s.demodulize.downcase
  end

  def load concern
    loader.load![concern || model_name]
  end

  protected

  def loader
    @loader ||= Config::Loader.new file
  end

  def file
    'models.yml'
  end
end

