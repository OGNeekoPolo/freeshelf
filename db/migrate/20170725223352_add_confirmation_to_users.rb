class AddConfirmationToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :confirmation, :string
  end
end
