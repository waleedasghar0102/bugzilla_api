 module Api::V1 


  class BugsController < ApplicationController
    before_action :find_bug, only: [:show ,:edit ,:update ,:destroy]
    def index
    	   @b = BugPolicy::Scope.new(current_user, Bug).resolve
         @pId=params[:project_id]
         @bugs= Bug.where(:project_id => @pId)
         render json: @bugs
    end


    def new
    	#@person = Person.new
      authorize @bug
    end

    def destroy
      authorize @bug
     @bug.destroy
     if @bug.destroy
        head :no_content, status: :ok
      else
        render json: @list.errors, status: :unprocessable_entity
      end 
     
    end

    def create
      @email = params[:qa_id]
      @qa = User.find_by(email: @email)
    	@bug = Bug.new(post_params)
      @bug.qa_id=@qa.id
      authorize @bug
       if @bug.save
        render json:@bug
      else
        render json: {status: "error", code: 3000, message: "Unable to create"}
      end

    end 

    
    def assignedBugs
        @dId=params[:developer_id]
        @bugs= Bug.where(:developer_id => @dId)
        byebug

    end


    def show
      #byebug
    end

    def edit
    end

    def update 
        @email = params[:developer_id]
        @developer = User.find_by(email: @email)
         @bug.developer_id=@developer.id
        if @bug.update(post_params)
          render json:@bug
        else 
          render 'edit'
        end

    end

    private

    def find_bug
      @bug = Bug.find(params[:id])
    end
     def post_params
     	params.require(:bug).permit(:title, :deadline ,:bugType ,:image , :status ,:project_id,:qa_id ) #why here the table name is singular even in db it is plural
     end


  end


end