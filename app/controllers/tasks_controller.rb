class TasksController < ApplicationController
    def index
      @tasks = Task.all.order(Arel.sql("CASE status WHEN 'Not Start' THEN 1 WHEN 'In Progress' THEN 2 WHEN 'Completion' THEN 3 END"), date: :asc)
      @task = Task.new
    end
    def new
      @task = Task.new
    end
    def create
      user = User.find_by(uid: session[:login_uid])
      @task = Task.new(title: params[:task][:title], date: params[:task][:date], memo: params[:task][:memo], user_id: user.id, status: params[:task][:status])
      if @task.save
        flash[:notice] = '1レコード追加しました'
        redirect_to tasks_path
      else
        render :new
      end
    end
    def destroy
      task = Task.find(params[:id])
      task.destroy
      flash[:notice] = '1レコード削除しました'
      redirect_to tasks_path
    end
    def show
      @task = Task.find(params[:id])
    end
    def edit
      @task = Task.find(params[:id])
    end
    def update
      @task = Task.find(params[:id])
      if @task.update(title: params[:task][:title], date: params[:task][:date], memo: params[:task][:memo], status: params[:task][:status])
        flash[:notice] = '1レコード更新しました'
        redirect_to tasks_path
      else
        render 'edit'
      end
    end
    def update_status
      @task = Task.find(params[:id])
      if params[:task].present?
        if @task.update(status: params[:task][:status])
          redirect_to tasks_path, notice: 'Task status was successfully updated.'
        end
      else
        flash[:alert] = 'Task status was not provided.'
        render :edit
      end
end


end
