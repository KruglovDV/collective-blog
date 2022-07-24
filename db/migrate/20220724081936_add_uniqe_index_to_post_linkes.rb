class AddUniqeIndexToPostLinkes < ActiveRecord::Migration[6.1]
  def change
    add_index :post_likes, %i[post_id user_id], unique: true
  end
end
