class TeclaCms::DocumentsController < ActionController::Base
  prepend_view_path Cms::Template::Resolver.instance

  protected
  
  def page
    Cms::Page.find(name: name)
  end

  def name
    params[:name]
  end

  def template
    params[:template]
  end

  def layout
    params[:template]
  end
  
end
