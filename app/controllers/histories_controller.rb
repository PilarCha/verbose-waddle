class HistoriesController < ApplicationController
  def create
    lender=Lender.find(session[:id])
    borrower=Borrower.find(params[:id])
    amount=params[:amount].to_i
    lender.decrement(:money,amount)
    if lender.money>=0
      lender.decrement!(:money,amount)
      borrower.increment!(:raised,amount)
      History.create(amount: amount, lender:lender, borrower:borrower)
      redirect_to :back
    else
      flash[:notice]="Not enough Dinero!"
      redirect_to :back
    end


  end
end
