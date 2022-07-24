class AddUserToPostLikes < ActiveRecord::Migration[6.1]
  def change
    add_reference :post_likes, :user, null: false, foreign_key: true
  end
end
