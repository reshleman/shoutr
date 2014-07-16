class TextShout < ActiveRecord::Base
  validates :body, presence: true
end
