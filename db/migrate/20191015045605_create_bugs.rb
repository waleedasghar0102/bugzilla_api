class CreateBugs < ActiveRecord::Migration[5.2]
  def change
    create_table :bugs do |t|
      t.string :title
      t.date :deadline
      t.string :image
      t.string :type
      t.string :status
      t.belongs_to :project
      t.belongs_to :qa
      t.belongs_to :developer
      t.timestamps
    end
  end
end
