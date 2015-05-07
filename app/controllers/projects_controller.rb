class ProjectsController < ApplicationController
  respond_to :json

  # PATH: '/projects/index'
  # GET - Admin - All Projects
  # @return [Aray] JSON Array of projects
  def index
    @projects = Project.all.to_a
    respond_success_json_data(@projects.to_json, {info: 'projects index'})
  end

end