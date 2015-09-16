class TeclaCms::PagesController < TeclaCms::ApplicationController
  def show
    render text: template, layout: layout, locals: page.to_json
  end

  protected

  def page
    #Cms::Page.find(name: name)
    Cms::Block.find_by(:title => "block3")
  end

  def name
    params[:name]
  end

  def template
    #params[:template]
    content = Cms::Template.find_by(:name => "my-template", :type => "template").content
    parse_template = Liquid::Template.parse(content)
    render_template = parse_template.render(page.as_json)
  end

  def layout
    #params[:template]
    content = Cms::Template.find_by(:name => "my-layout", :type => "layout" ).content
    parse_template = Liquid::Template.parse(content)
    render_template = parse_template.render(page.as_json)
  end
end
