class UsersController < ApplicationController
 
  before_action :find_user, only: [:show ,:edit ,:update ,:destroy]
  def index
    Qa.all
  	byebug
  end


  def new
  	#@person = Person.new

  end

  def destroy
   # @person.destroy
   # redirect_to root_path
  end

  def create
=begin
  	 @p = Person.new(post_params)

  	 if @p.save
 
  		redirect_to @p
  	else
  		render 'new'
  	end
=end
  end 

  def show
    #byebug
  end

  def edit
  end

  def update 
=begin
      if @person.update(post_params)
        redirect_to @person
      else 
        render 'edit'
      end
=end
  end

  private

  def find_post
    @person = Person.find(params[:id])
  end
   def post_params
   	params.require(:person).permit(:type ) #why here the table name is singular even in db it is plural

   end


end
end
end
