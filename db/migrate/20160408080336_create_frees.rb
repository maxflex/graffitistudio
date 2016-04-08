class CreateFrees < ActiveRecord::Migration
  def change
    create_table :frees do |t|
      t.string :url

      t.timestamps null: false
    end
  end
end
