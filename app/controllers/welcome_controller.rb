# :nodoc:
class WelcomeController < ApplicationController
  def index
    @card = Card.for_review.first
  end

  def check_translation
    @card = Card.find(params[:id])
    if @card.right_translation(params[:user_input])
      @card.update_review_date
      flash[:notice] = "=)"
      redirect_to root_path
    else
      flash[:alert] = "=("
      redirect_to root_path
    end
  end
end
