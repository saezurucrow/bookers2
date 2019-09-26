class Renamecolumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :books, :body, :body
  end
end
