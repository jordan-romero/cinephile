class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.date :release_date
      t.string :genre
      t.integer :runtime

      t.timestamps
    end
  end
end
