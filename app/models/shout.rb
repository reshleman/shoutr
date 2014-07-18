class Shout < ActiveRecord::Base
  belongs_to :user
  belongs_to :content, polymorphic: true

  default_scope { order(created_at: :desc) }

  paginates_per 10

  def self.search(query, content_class = TextShout)
    content_ids = content_class.search(query).select(:id)
    where(
      content_type: content_class.to_s,
      content_id: content_ids
    ).includes(:content, :user)
  end
end
