class Categories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string   :name
      t.timestamps
    end#create
  end#def
end#class
