module Renderable
  extend ActiveSupport::Concern

  # Usage block.render template: template, layout: layout
  def render opts = {}
    renderer.render opts
  end

  protected

  # must have a template and layout method or field
  def validate_render!
    throw 'Not a valid renderable' unless valid_render?
  end

  def valid_render?
   [:template, :layout].each {|method| self.respond_to? method }
  end

  # can we cache it?
  def renderer
    Cms::RenderTemplate.new
  end

end
