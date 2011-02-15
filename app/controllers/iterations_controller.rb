class IterationsController < ApplicationController
  respond_to :html

  # def index
  #  respond_with(@iterations = Iteration.all)
  # end

  def show
    respond_with(@iteration = Iteration.find(params[:id]))
  end

  def new
    @project = Project.find(params[:project_id])
    respond_with(@iteration = Iteration.new)
  end

  def edit
    respond_with(@iteration = Iteration.find(params[:id]))
  end

  def create
    @iteration = Iteration.create(params[:iteration])
    flash[:notice] = 'Iteration was successfully created.'
    respond_with(Project.find(params[:project_id]), @iteration)
  end

  def update
    @iteration = Iteration.find(params[:id])
    flash[:notice] = 'Iteration was successfully updated.' if @iteration.update_attributes(params[:iteration])
    respond_with(Project.find(params[:project_id]), @iteration)
  end

  def destroy
    @iteration = Iteration.find(params[:id])
    project = @iteration.project
    @iteration.destroy
    redirect_to project_path(project)
  end
end
