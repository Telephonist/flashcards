# :nodoc:
class WelcomeController < ApplicationController
  def index
    @card = Card.for_review.first
  end

  def check_translation
    puts params[:user_input]
    puts params[:id]
    puts params[:review_date]
    @card = Card.find(params[:id])
    user_input = params[:user_input]
    if @card.translated_text ==  user_input
      @card.update("review_date" => Date.today + 5.days)
      flash[:notice] = "=)"
    else
      flash[:alert] = "=("
    end
    redirect_to root_path
  end
end
