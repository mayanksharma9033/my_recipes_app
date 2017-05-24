class AddPasswordResetToChefs < ActiveRecord::Migration[5.0]
  def change
    add_column :chefs, :password_reset_token, :string
    add_column :chefs, :password_reset_sent_at, :datetime
  end
end
