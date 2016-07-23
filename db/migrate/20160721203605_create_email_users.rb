class CreateEmailUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :email_users do |t|
      t.string :name
      t.string :email
      t.string :login

      t.timestamps
    end
  end
end
