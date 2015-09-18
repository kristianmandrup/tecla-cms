# TODO: This is NOT a model. Move it!
class Template::Resolver < ActionView::Resolver
  require 'singleton'
  include Singleton

  attr_accessor :finder

  def initialize
    @finder = Template::TemplateFinder.instance
  end

  def type prefix
    prefix.empty? ? 'template' : 'layout'
  end

  def find_templates name, prefix, partial, details
    create_template record(name, type(prefix)), partial, details
  end

  def record name, type
    finder.find name, type
  end

  def create_template record, partial, details
    Template::Creator.new(record, partial, details).create
  end
end
