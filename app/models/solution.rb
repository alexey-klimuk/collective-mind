class Solution < ActiveRecord::Base

  acts_as_votable

  validates_presence_of :body

  attr_accessible :user_id, :question_id, :body

  belongs_to :user
  belongs_to :question

  def rating
    self.upvotes.length - self.downvotes.length
  end

end
