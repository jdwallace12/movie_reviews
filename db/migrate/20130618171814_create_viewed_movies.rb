class CreateViewedMovies < ActiveRecord::Migration
  def change
    create_table :viewed_movies do |t|
      t.integer :user_id
      t.integer :movie_id

      t.timestamps
    end
  end
end
