class WelcomeController < ApplicationController
  include OpenbankHelper
  def index
  end

  def verify
  end

  def payment
    response = pay(params[:article], params[:amount])
    description = response[:description]


  end
end
