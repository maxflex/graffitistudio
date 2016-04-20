class CreateTestPays < ActiveRecord::Migration
  def change
    create_table :test_pays do |t|
      t.string :field
      t.string :second_field
      t.string :thyrty_field

      t.timestamps null: false
    end
  end
end
