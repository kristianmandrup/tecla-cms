class Cms::Template::TemplateFinder
  require 'singleton'
  include Singleton

  def find_template(name)
    find(name, 'template')
  end

  def find_layout(name)
    find(name, 'layout')
  end

  # or via type: 'partial'
  def find_partial(name)
    find_template("_#{name}")
  end

  def find(name, type)
    Template.find(name: name, type: type)
  end
end
