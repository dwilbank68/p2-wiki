class AddAccountActivationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :account_activation, :datetime
  end
end
