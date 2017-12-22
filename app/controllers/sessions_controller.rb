class SessionsController < ApplicationController
  skip_before_action :loggin_user, only: [:login,:borr_login]
  def login
    lender=Lender.find_by_email(params[:email])
    borr=Borrower.find_by_email(params[:email])
    if lender && lender.authenticate(params[:password])
      session[:id]=lender.id
      redirect_to "/lenders/#{session[:id]}"
    elsif borr && borr.authenticate(params[:password])
      session[:id]=borr.id
      redirect_to "/borrowers/#{session[:id]}"
    else
      flash[:notice]="Invalid combination"
      redirect_to :back
    end
  end
  def logout
    reset_session
    redirect_to '/login'
  end

end
