class Renamebook < ActiveRecord::Migration[5.2]
  def change
    rename_table :books, :books
  end
end
