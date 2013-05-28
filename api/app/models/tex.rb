class Tex < ActiveRecord::Base
  HASHTAG_REGEXP = /#([a-zA-Z]+)/

  attr_accessible :message
  has_and_belongs_to_many :hash_tags
  validates :message, length: {minimum: 1, maximum: 142}

  before_create :extract_ht

  default_scope order('created_at DESC')
  paginates_per 30

  protected
  def extract_ht
    msg = message

    while msg =~ HASHTAG_REGEXP
      msg = $'
      hash_tags << HashTag.find_or_create_by_name($1)
      hash_tags.map &:touch
    end
  end
end
