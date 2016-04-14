class CreateLinkdumps < ActiveRecord::Migration
  def change
    create_table :linkdumps do |t|
      t.string :url

      t.timestamps null: false
    end
  end
end
