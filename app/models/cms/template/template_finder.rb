# TODO: This is NOT a model. Move it!
class Cms::Template::TemplateFinder
  require 'singleton'
  include Singleton

  def find_template(name)
    find(name, 'template')
  end

  def find_layout(name)
    find(name, 'layout')
  end

  def find_partial(name)
    find(name, 'partial')
  end

  def find(name, type)
    Cms::Template.find_by(name: name, type: type)
  end
end
