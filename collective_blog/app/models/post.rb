# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
  belongs_to :category
  validates :title, :body, presence: true
  has_many :comments, class_name: 'PostComment', dependent: :destroy
end
