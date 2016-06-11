class WelcomeController < ApplicationController
  include OpenbankHelper
  def index
    @transactions = Transaction.all
  end


  def create
    response = pay(params[:article], params[:amount])
    description = response[:description]

  end
end
