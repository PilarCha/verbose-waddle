class BorrowersController < ApplicationController
  skip_before_action :loggin_user, only: [:create]
  def create
    borr=Borrower.new(borr_params)
    if borr.save
      flash[:notice]="Welcome Borrower! Please sign in!"
      redirect_to '/login'
    else
      flash[:alert]=borr.errors.full_messages
      redirect_to :back
    end
  end
  def show
    @user=Borrower.find(params[:id])
    @lenders=History.includes(:lender).where(borrower_id: session[:id]).select(:first_name,:email,:lender_id,"SUM(histories.amount) AS amount").group(:lender_id)
  end
  private
    def borr_params
      params.require(:borrower).permit(:first_name,:last_name,:email,:password,:password_confirmation,:purpose,:description,:money)
    end
end
