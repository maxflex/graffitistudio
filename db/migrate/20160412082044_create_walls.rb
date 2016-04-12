class CreateWalls < ActiveRecord::Migration
  def change
    create_table :walls do |t|
      t.string :url
      t.string :desc
      t.string :img

      t.timestamps null: false
    end
  end
end
