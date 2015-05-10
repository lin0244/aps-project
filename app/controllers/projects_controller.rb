class ProjectsController < ApplicationController
  respond_to :json

  # PATH: '/projects/index'
  # GET - Admin - All Projects
  # @return [Array] JSON Array of projects
  def index
    @projects = Project.all.to_a
    respond_success_json_data(@projects.to_json, {info: 'projects index'})
  end

  # PATH: '/projects/create'
  # POST - Admin - Add new project
  # @param [JSON] params data: {project: {email, password, password_confirmation, name, surname, position_id, admin}}
  def create
    @project = Project.new(project_params)
    if @project.save
      respond_success_json
    else
      respond_error_json(@project.errors.full_messages)
    end
  end

  # PATH: '/projects/show'
  # GET - Add show project with given id
  # @param [JSON] params data: {project: {id}}
  # @return [Object] JSON with project Object
  def show
    @project = Project.find(params[:id])
    respond_success_json_data(@project.to_json, {info: 'got project'})
  end

  private

  def project_params
    params.require(:project).permit(:id, :title, :start_date, :end_date, :manager_id)
  end

end
