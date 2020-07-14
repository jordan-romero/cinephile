class AddFkToMovies < ActiveRecord::Migration[6.0]
  def change
    add_column :movies, :list_id, :integer
  end
end
