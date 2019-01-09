class CreateInvites < ActiveRecord::Migration[5.2]
  def change
    create_table :invites do |t|
      t.belongs_to :meal
      t.belongs_to :sender
      t.belongs_to :receiver
      t.string :status, default: "pending"

      t.timestamps
    end
  end
end
