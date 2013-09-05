class CreateNewspapers < ActiveRecord::Migration
  def change
    create_table :newspapers do |t|
      t.string :title
      t.datetime :date
      t.string :link
      t.timestamps
    end
  end
end
