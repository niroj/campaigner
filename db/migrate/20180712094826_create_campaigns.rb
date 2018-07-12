class CreateCampaigns < ActiveRecord::Migration[5.1]
  def change
    create_table :campaigns, id: :uuid do |t|
      t.string :title
      t.text :tags
      t.integer :duration
      t.uuid :creator_id

      t.timestamps
    end
  end
end
