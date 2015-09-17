class Cms::ComponentsController < Cms::DocumentController
  def show
    render template: template, layout: layout, locals: page.to_json
  end


end
