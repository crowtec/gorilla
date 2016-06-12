class WelcomeController < ApplicationController
  def index
  end

  def verify
  end

  def final
    Transaction.create(voice_test: params[:voice], user_status: params[:user_status])
    @notice = params[:status] ? "Pago realizado correctamente. Has comprado el artículo #{params[:article]}." : "Lo sentimos, no has superado el test de Gorilla."
  end


end
