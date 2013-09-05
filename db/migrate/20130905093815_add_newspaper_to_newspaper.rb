class AddNewspaperToNewspaper < ActiveRecord::Migration
  def change
    add_column :newspapers, :newspaper, :string
  end
end
