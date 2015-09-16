class Cms::Page
  def create opts = {}
    Cms::Template.new(opts.merge(type: 'template'))
  end

  def find opts = {}
    Cms::Template.find(opts.merge(type: 'template'))
  end
end
