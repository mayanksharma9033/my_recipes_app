class AddAuthTokenToChefs < ActiveRecord::Migration[5.0]
  def change
    add_column :chefs, :auth_token, :string
  end
end
