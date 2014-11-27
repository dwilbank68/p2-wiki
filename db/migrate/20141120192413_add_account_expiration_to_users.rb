class AddAccountExpirationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :account_expiration, :datetime
  end
end
