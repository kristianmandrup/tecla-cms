class TeclaCms::PagesController < TeclaCms::DocumentController
  def show
    render template: template, layout: layout, locals: page.to_json
  end


end
