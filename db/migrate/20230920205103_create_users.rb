class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username, limit: 20
      t.string :display_name, limit: 20
      t.string :email
      t.string :password
      t.string :bio
      t.string :location

      t.timestamps
    end
  end
end
