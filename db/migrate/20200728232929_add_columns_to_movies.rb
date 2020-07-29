class AddColumnsToMovies < ActiveRecord::Migration[6.0]
  def change
    add_column :movies, :actors, :string
    add_column :movies, :plot, :string
    add_column :movies, :imdbRating, :float
    add_column :movies, :director, :string
  end
end
