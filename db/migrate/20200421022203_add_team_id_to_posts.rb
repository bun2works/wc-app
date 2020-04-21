class AddTeamIdToPosts < ActiveRecord::Migration[6.0]
  def change
    add_reference :posts, :team, null: false, foreign_key: true, index: true, before: :name
  end
end
