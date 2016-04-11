class AddUrlOriginalToFrees < ActiveRecord::Migration
  def change
    add_column :frees, :url_original, :string
  end
end
