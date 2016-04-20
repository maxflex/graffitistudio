class CreatePromotes < ActiveRecord::Migration
  def change
    create_table :promotes do |t|
      t.string :email
      t.string :url
      t.string :string
      t.string :desc
      t.string :string
      t.string :subject
      t.string :string
      t.string :fio
      t.string :string
      t.boolean :pay

      t.timestamps null: false
    end
  end
end
