class Qa  < User
	has_many :bugs
	has_and_belongs_to_many :projects, foreign_key: :user_id ,uniqueness: true
end