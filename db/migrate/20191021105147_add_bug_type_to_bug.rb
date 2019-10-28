class AddBugTypeToBug < ActiveRecord::Migration[5.2]
  def change
  	  	 add_column :bugs, :bugType, :string

  end
end
