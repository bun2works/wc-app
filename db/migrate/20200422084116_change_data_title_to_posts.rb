class ChangeDataTitleToPosts < ActiveRecord::Migration[6.0]
  def change
    change_column :posts, :title, :text
  end
end
