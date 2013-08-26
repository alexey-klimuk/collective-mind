class Question < ActiveRecord::Base

  acts_as_votable

  acts_as_taggable

  validates_presence_of :title, :body

  attr_accessible :user_id, :title, :body, :active, :tag_list

  belongs_to :user
  has_many :solutions

  scope :active, -> { where(active: true).order('created_at DESC') }

  def rating
    self.upvotes.length - self.downvotes.length
  end

end
