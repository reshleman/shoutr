class TextShout < ActiveRecord::Base
  validates :body, presence: true

  has_one :shout, as: :content, dependent: :destroy

  def self.search(query)
    where("body ILIKE ?", "%#{query}%")
  end
end
