class Project < ApplicationRecord
	validates :title, uniqueness: true
	belongs_to :manager , class_name: 'Manager'
	has_and_belongs_to_many :users ,uniqueness: true
	has_and_belongs_to_many :developers, :join_table => "projects_users", :association_foreign_key => "user_id" , uniqueness: true
	has_and_belongs_to_many :qas, :join_table => "projects_users", :association_foreign_key => "user_id" , uniqueness: true
	has_many :bugs
end
