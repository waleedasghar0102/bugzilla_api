class ApplicationController < ActionController::API
        include DeviseTokenAuth::Concerns::SetUserByToken
      	include Pundit
        before_action :configure_permitted_parameters, if: :devise_controller?
        # after_action :set_user_type, only: [:create], if: :devise_controller?
        protected

		  def configure_permitted_parameters

		    devise_parameter_sanitizer.permit(:sign_up, keys: [:id, :name, :type , :email ])
		  
		  end

		  # def set_user_type
		  # 	if request.path === "/auth/sign_in"
		  # 		json=response.body
		  # 		type = {type: current_user.type}
		  # 		 hash= JSON.parse(json)
		  # 		 hash["data"]=hash["data"].merge!(type: current_user.type)
		  # 		 response.body=hash.to_json
		  # 		#response.body
		  # 	end
		  # end
end
