class CreateKudoers < ActiveRecord::Migration
  def change
    create_table :kudoers do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :password_digest
      t.string :remember_token
      t.timestamps
    end
    add_index :kudoers, :email, unique: true
    add_index :kudoers, :remember_token
  end
end
