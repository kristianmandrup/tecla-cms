class Cms::Block

  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::History::Trackable
  include Mongoid::Orderable
  include Cms::Publishable  

  CATEGORIES = %w(Apparel Media Software Sports Agri Education)
  TAGS = %w(Banner, Football)
  TYPE = %w(Page, Block)

  field :prototype,   type: String
  field :title,       type: String, localize: true
  field :categories,  type: Array
  field :tags,        type: Array
  field :template,    type: Array
  field :summary,     type: String, localize: true
  field :content,     type: String, localize: true
  field :description, type: String
  
  validates :title, presence: true
  validates :content, presence: true
  
  has_many :images, class_name: "Cms::Image", as: :imageable
  has_many :generic_attributes, class_name: "Cms::GenericAttribute",  as: :generic
  
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
  
  def tranlate
    translator = Cms::Translator.new
    self.title_translations = translator.translate(self.title)
    self.summary_translations = translator.translate(self.summary) unless self.summary.blank?
    self.content_translations = translator.translate(self.content) unless self.content.blank?
    self.save!
  end
end
