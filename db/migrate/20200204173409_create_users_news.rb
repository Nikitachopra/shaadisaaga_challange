class CreateUsersNews < ActiveRecord::Migration[6.0]
  def change
    create_table :users_news do |t|
      t.references :user, null: false, foreign_key: true
      t.references :news, null: false, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end
