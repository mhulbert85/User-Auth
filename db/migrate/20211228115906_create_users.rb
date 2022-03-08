class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users, id: :string, force: :cascade do |t|
      ## Registerable
      t.string :email
      t.string :password_digest

      ## Recoverable
      t.string :reset_password_token
      t.datetime :reset_password_token_sent_at, default: nil

      ## Confirmable
      t.boolean :confirmed_by_email, default: false

      ## Accounts
      t.integer :roles, default: 0

      t.timestamps
    end
  end
end
