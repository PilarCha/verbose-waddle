class LendersController < ApplicationController
  skip_before_action :loggin_user, only: [:create]
  def create
    lend=Lender.new(lender_params)
    if lend.save
      flash[:notice]="You have Successfully registeredas a Lender Please login"
      redirect_to '/login'
    else
      flash[:errors]=lend.errors.full_messages
      redirect_to :back
    end
  end
  def show
    @user=Lender.find(params[:id])
    @need=Borrower.all
    @lent=History.includes(:borrower).where(lender: @user).select(:first_name,:purpose,:description,:raised,:money,:borrower_id, "SUM(histories.amount) AS amount" ).group(:borrower_id)
  end

  private
    def lender_params
      params.require(:lender).permit(:first_name,:last_name,:email,:password,:password_confirmation,:money)
    end
end
