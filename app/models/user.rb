class User < ApplicationRecord
  has_many :tweets
  has_many :images
  has_many :comments
  has_and_belongs_to_many :followers, join_table: 'followers_followings', class_name: 'User', foreign_key: 'followee_id', association_foreign_key: 'follower_id'
  has_and_belongs_to_many :followings, join_table: 'followers_followings', class_name: 'User', foreign_key: 'follower_id', association_foreign_key: 'followee_id'
  has_many :followers_tweets, through: :followers, source: :tweets
  has_many :followings_tweets, through: :followings, source: :tweets
end
