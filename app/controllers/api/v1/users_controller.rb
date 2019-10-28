module Api::V1 

class UsersController < ApplicationController
 
  #before_action :find_user, only: [:show ,:edit ,:update ,:destroy]
  def index
  
    @type = params[:type]
      byebug
    if @type=='Qa'
        @q=Qa.all
        render json:@q
        byebug
    elsif @type=='Developer'
        @d=Developer.all
        byebug
        render json:@d
  end

  def categoryshow

  end

  def new


  end

  def destroy

  end

  def create

  end 

  def show

  end


  def update 

  end
  def showProjectDev
  end


  def find_post
    @person = Person.find(params[:id])
  end
   def post_params
   	params.require(:person).permit(:type ) #why here the table name is singular even in db it is plural

   end


end

end
end
