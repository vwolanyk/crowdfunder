class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text   "comment_text"
      t.bigint "project_id"
      
      t.timestamps
    end
  end
end
