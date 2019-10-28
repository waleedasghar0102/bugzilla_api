module Api::V1 

  class ProjectsController < ApplicationController

  before_action :find_project, only: [:show ,:update ,:destroy, :showProjectDev,:showProjectQa, :delResource, :addResource]
    def index
        @projects = ProjectPolicy::Scope.new(current_user, Project).resolve
        render json: @projects
    end

    def new
    end
      
    def destroy
     @project.destroy
     if @project.destroy
        head :no_content, status: :ok
      else
        render json: @list.errors, status: :unprocessable_entity
      end  
    end

    def create
      @email = params[:manager_id]
      @manager= User.find_by(email: @email)
      @project = Project.new(project_params)
      @project.manager_id=@manager.id
      if @project.save
        render json:@project
      else
        render json: {status: "error", code: 3000, message: "Unable to create"}
      end
    end 

    def show
      byebug
      authorize @project
      render json: @project
    end

    def update
      authorize @project    
      if @project.update(project_params)
        render json: @project
      else 
        render json: @project.errors, status: :unprocessable_entity      
      end
    end


    def showProjectDev
        byebug
        @developers = @project.developers
        render json: @developers
    end
    def showProjectQa
        byebug
        @qas = @project.qas
        render json: @qas
    end

    def delResource
        if params[:type].present?
            @type = params[:type]
            @uId = params[:user_id]
            @user= User.find_by(id: @uId)
            if @type === 'Developer'
              @project.developers.delete(@user)
            else
              @projcet.qas.delete(@user)
            end
            if @project.update(project_params)
              render json: @project
            else 
              render json: @project.errors, status: :unprocessable_entity      
            end
        end
    end

    def addResource
        if params[:type].present?
            @type = params[:type]
            @uId = params[:user_id]
            @user= User.find_by(id: @uId)
            if @type === 'Developer'
              if @project.developers.include?(@user)
                 @project.developers << @user
              end
            else
              if @project.qas.include?(@user)
                 @project.qas << @user
              end
            end
            if @project.update(project_params)
              render json: @project
            else 
              render json: @project.errors, status: :unprocessable_entity      
            end
        end
    end

    private

    def find_project
      byebug
      @project = Project.find(params[:id])
    end

    def project_params
     	params.require(:project).permit(:title, :deadline ,:project_id) #why here the table name is singular even in db it is plural
    end
  end
end