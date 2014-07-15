class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

  has_many :shouts

  has_many :followed_user_relationships,
            class_name: "FollowingRelationship",
            foreign_key: :follower_id

  has_many :followed_users, through: :followed_user_relationships

  has_many :follower_relationships,
            class_name: "FollowingRelationship",
            foreign_key: :followed_user_id

  has_many :followers, through: :follower_relationships

  def to_param
    username
  end
end
