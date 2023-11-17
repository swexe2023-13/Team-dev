class TopController < ApplicationController
  def main
    render "login"
  end

  def login
    user = User.find_by(uid: params[:uid])
    if user && BCrypt::Password.new(user.password_digest) == params[:password]
      session[:login_uid] = params[:uid]
      redirect_to tasks_path  # ツイート一覧ページへリダイレクト
    else
     render "login"
    end
  end

  def logout
    session.delete(:login_uid)
    redirect_to root_path
  end
end