class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments, id: :uuid do |t|
      t.string :title
      t.uuid :commentor_id
      t.uuid :commentable_id
      t.string :commentable_type

      t.timestamps
    end
  end
end
