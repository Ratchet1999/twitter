class User < ApplicationRecord
  with_options dependent: :nullify do
    has_many :tweets
    has_many :images
    has_many :comments
  end
  # has_and_belongs_to_many :followers, join_table: 'followers_followings', class_name: 'User', foreign_key: 'followee_id', association_foreign_key: 'follower_id'
  # has_and_belongs_to_many :followings, join_table: 'followers_followings', class_name: 'User', foreign_key: 'follower_id', association_foreign_key: 'followee_id'
  has_many :follower_records, class_name: 'FollowersFollowing', foreign_key: :followee_id
  has_many :following_records, class_name: 'FollowersFollowing', foreign_key: :follower_id
  has_many :followers, through: :follower_records
  has_many :followings, through: :following_records
  has_many :followers_tweets, through: :followers, source: :tweets
  has_many :followings_tweets, through: :followings, source: :tweets
end
