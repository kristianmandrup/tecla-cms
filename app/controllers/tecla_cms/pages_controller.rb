class TeclaCms::PagesController < TeclaCms::DocumentsController
  def show
    render template: template, layout: layout, locals: page.to_json
  end


end
