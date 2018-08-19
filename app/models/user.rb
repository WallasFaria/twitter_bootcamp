class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :tweets

  has_many :follower_relationships, class_name: :Relationship,
                                    foreign_key: :followed_id,
                                    dependent: :destroy

  has_many :followed_relationships, class_name: :Relationship,
                                    foreign_key: :follower_id,
                                    dependent: :destroy

  has_many :followers, class_name: :User,
                       through: :follower_relationships

  has_many :following, class_name: :User,
                       through: :followed_relationships,
                       source: :followed

  def follow!(other_user)
    following << other_user
  end

  def unfollow!(other_user)
    following.destroy(other_user)
  end

  def following?(other_user)
    following.include? other_user
  end
end
