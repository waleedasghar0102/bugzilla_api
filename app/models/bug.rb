class Bug < ApplicationRecord
	belongs_to :project
	belongs_to :qa , class_name: 'Qa'
	belongs_to :developer , class_name: 'Developer', optional: true
	validates :title, :status, :bugType, presence: true
	validates :title, uniqueness: true
	#validates :image, format: {with: /\.(png|jpg)\Z/i}


end
