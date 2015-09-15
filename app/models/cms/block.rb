class Cms::Block

  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::History::Trackable
  include Mongoid::Orderable
  include Cms::Publishable
  include RenderAnywhere

  CATEGORIES = %w(Apparel Media Software Sports Agri Education)
  TAGS = %w(Banner, Football)
  TYPE = %w(Page, Block)

  field :prototype,   type: String
  field :title,       type: String, localize: true
  field :categories,  type: Array
  field :tags,        type: Array
  field :templates,    type: Array
  field :summary,     type: String, localize: true
  field :content,     type: String, localize: true
  field :description, type: String
  
  validates :title, presence: true, uniqueness: true
  validates :content, presence: true
  
  has_many :images, class_name: "Cms::Image", as: :imageable
  has_many :generic_attributes, class_name: "Cms::GenericAttribute",  as: :generic
  has_many :templates, class_name: "Cms::Template", as: :templatable
  
  accepts_nested_attributes_for :generic_attributes , allow_destroy: true
  
  # track history
  track_history     :on => [:title, :description]
  
  # ordered list implementation for your mongoid models
  orderable

  has_and_belongs_to_many :block_lists, class_name: "Cms::BlockList", inverse_of: :blocks
  belongs_to :named_block, class_name: "Cms::NamedBlock", inverse_of: :block

  def as_json(options={})
    super(:only => [:title,:summary, :content], :methods => :type)
  end

  def type
    self.class.name.gsub("Cms::", "")
  end
  
  def get_template(template_name, layout_name) 
    template = (template_name.blank?) ? self.templates.first : self.templates.find_by(:name => params[:template])
    
    parse_template = Liquid::Template.parse(template.content)
    render_template = parse_template.render(block.as_json)
    
    layout = Cms::Layout.get_layout(layout_name)
    parse_layout = Liquid::Template.parse(layout.content)
    parse_layout.render("content_for_layout" => render_template)
  end
  
  def translate
    translator = Cms::Translator.new(Cms::MicrosoftTranslator.new)
    self.title_translations = translator.translate(self.title)
    self.summary_translations = translator.translate(self.summary) unless self.summary.blank?
    self.content_translations = translator.translate(self.content) unless self.content.blank?
    self.save!
  end
  
end
