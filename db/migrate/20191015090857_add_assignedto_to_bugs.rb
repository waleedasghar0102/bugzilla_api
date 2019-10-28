class AddAssignedtoToBugs < ActiveRecord::Migration[5.2]
  def change
  	    add_column :bugs, :assignedTo, :bigint

  end
end
 