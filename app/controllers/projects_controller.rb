class ProjectsController < ApplicationController
  respond_to :html

  def index
    respond_with(@projects = Project.all)
  end

  def show
    respond_with(@project = Project.find(params[:id]))
  end

  def new
    respond_with(@project = Project.new)
  end

  def edit
    respond_with(@project = Project.find(params[:id]))
  end

  def create
    @project = Project.create(params[:project])
    flash[:notice] = 'Project was successfully created.'

    respond_with(@project, :location => @project)
  end

  def update
    @project = Project.find(params[:id])
    @project.update_attributes(params[:project])
    flash[:notice] = 'Project was successfully updated.'
    respond_with(@project, :location => @project)
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    respond_with(@project, :head => :ok)
  end
end
