class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.belongs_to :sender
      t.belongs_to :receiver
      t.string :message
      t.boolean :unread, default: true
    end
  end
end
