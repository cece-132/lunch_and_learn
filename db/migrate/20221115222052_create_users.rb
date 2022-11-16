class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users, id: false do |t|
      t.string :name
      t.string :email
      t.string :api_key

      t.timestamps
    end
    add_index :users, :api_key, unique: true
  end
end
