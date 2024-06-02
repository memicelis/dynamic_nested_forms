class TasksController < ApplicationController
  def new
    render turbo_stream
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
  rescue ActiveRecord::RecordNotFound
    task = Task.new(id: params[:id])
  ensure
    render turbo_stream
  end
end
