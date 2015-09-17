module Renderable
  # Usage block.render template: template, layout: layout
  def render opts = {}
    renderer.render opts
  end

  # is this the Template handler to be used for rendering?
  def handler template
    Liquid::Template.parse template || @template
  end

  protected

  # must have a template and layout method or field
  def validate!
    throw 'Not a valid renderable' unless valid?
  end

  #def valid?(context = nil)
  #  [:template, :layout].each {|method| self.respond_to? method }
  #end

  # can we cache it?
  def renderer
    Cms::RenderTemplate.new
  end

end
