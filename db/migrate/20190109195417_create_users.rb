class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.float :lat, default: 29.760427
      t.string :user_description, default: "Sorry, there is no description at this time."
      t.float :long, default: -95.369804
      t.timestamps
    end
  end
end
