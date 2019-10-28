class ChangeUserTypeToBeEnumInUsers < ActiveRecord::Migration[5.2]
  def change
  	  change_column :users, :user_type, :string
  end
end
