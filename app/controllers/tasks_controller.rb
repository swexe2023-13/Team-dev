class TasksController < ApplicationController
    def index
      @tasks = Task.all
    end
    def new
      @task = Task.new
    end
    def create
      user = User.find_by(uid: session[:login_uid])
      @task = Task.new(title: params[:task][:title], date: params[:task][:date], todo: params[:task][:todo], memo: params[:task][:memo], user_id: user.id)
      if @task.save
        flash[:notice] = '1レコード追加しました'
        redirect_to root_path
      else
        render :new
      end
    end
    def destroy
      tweet = Task.find(params[:id])
      tweet.destroy
      flash[:notice] = '1レコード削除しました'
      redirect_to root_path
    end
    def show
      @task = Task.find(params[:id])
    end
    def edit
      @task = Task.find(params[:id])
    end
    def update
      @task = Task.find(params[:id])
      if @task.update(title: params[:task][:title], date: params[:task][:todo], todo: params[:task][:todo], memo: params[:task][:memo])
        flash[:notice] = '1レコード更新しました'
        redirect_to root_path
      else
        render 'edit'
      end
    end
end
