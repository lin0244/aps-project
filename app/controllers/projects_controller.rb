class ProjectsController < ApplicationController
  respond_to :json

  # PATH: '/projects/index'
  # GET - All Projects
  # @return [Array] JSON Array of projects
  def index
    @projects = Project.all.to_a
    respond_success_json_data(@projects.to_json, {info: 'projects index'})
  end

  # PATH: '/projects/create'
  # POST - Add new project
  # @param [JSON] params data: {:title, :start_date, :end_date, :manager_id}
  def create
    @project = Project.new(title: params[:title], start_date: params[:start_date], end_date: params[:end_date], manager_id: params[:manager_id])
    if @project.save
      respond_success_json
    else
      respond_error_json(@project.errors.full_messages)
    end
  end

  # PATH: '/projects/show'
  # GET - Add show project with given id
  # @param [JSON] params data: {id}
  # @return [Object] JSON with project Object
  def show
    @project = Project.find(params[:id])
    respond_success_json_data(@project.to_json, {info: 'got project'})
  end

  # PATH: '/projects/update'
  # POST - Update project with given id
  # @param [JSON] params data: {id, title, start_date, end_date, manager_id}
  # @return [Object] JSON with project Object
  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(title: params[:title], start_date: params[:start_date], end_date: params[:end_date], manager_id: params[:manager_id])
      respond_success_json_data(@product.to_json, {info: 'updated'})
    else
      render json: { info: 'not updated' }
    end
  end

  # PATH: '/projects/delete'
  # DELETE - delete project with given id
  # @param [JSON] params data: { id }
  def destroy
    @project = Project.find(params[:id])
    render json: { info: 'project deleted' } if @project.destroy
  end

end
