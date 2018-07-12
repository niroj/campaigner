class CreateTodos < ActiveRecord::Migration[5.1]
  def change
    create_table :todos, id: :uuid do |t|
      t.string :title
      t.uuid :creator_id
      t.boolean :completed
      t.uuid :completed_by_id
      t.uuid :campaign_id

      t.timestamps
    end
  end
end
