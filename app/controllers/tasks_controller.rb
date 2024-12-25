class TasksController < ApplicationController
  def new
    respond_to do |format|
      format.turbo_stream
    end
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
  rescue ActiveRecord::RecordNotFound
    task = Task.new(id: params[:id])
  ensure
    respond_to do |format|
      format.turbo_stream
    end
  end
end
