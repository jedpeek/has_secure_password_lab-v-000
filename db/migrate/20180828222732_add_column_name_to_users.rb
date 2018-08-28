class AddColumnNameToUsers < ActiveRecord::Migration
  def change
    add_columm :users, :name, :string
    remove_column :users, :username, :string
  end
end
