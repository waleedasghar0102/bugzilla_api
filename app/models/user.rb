class User < ApplicationRecord
    # Include default devise modules.
    has_and_belongs_to_many :projects
    devise :database_authenticatable, :registerable,
            :recoverable, :rememberable, :trackable, :validatable
            #:confirmable, :omniauthable
    include DeviseTokenAuth::Concerns::User
    enum type: { 
    	'Manager' => 0, 
    	'Developer' => 1, 
    	'Qa' =>2 
    }
    def as_json(options={})
      super(options).merge({type: type})
    end
end
