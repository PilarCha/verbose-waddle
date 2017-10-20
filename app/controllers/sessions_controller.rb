class SessionsController < ApplicationController
  skip_before_action :loggin_user, only: [:lend_login,:borr_login]
  def lend_login
    lender=Lender.find_by_email(params[:email])
    if lender && lender.authenticate(params[:password])
      session[:id]=lender.id
      redirect_to "/lenders/#{session[:id]}"
    else
      flash[:notice]="Invalid combination"
      redirect_to :back
    end
  end
  def borr_login
    borr=Borrower.find_by_email(params[:email])
    if borr && borr.authenticate(params[:password])
      session[:id]=borr.id
      redirect_to "/borrowers/#{session[:id]}"
    else
      flash[:alert]="Invalid combination"
      redirect_to :back
    end
  end
  def logout
    reset_session
    redirect_to '/register'
  end

end
