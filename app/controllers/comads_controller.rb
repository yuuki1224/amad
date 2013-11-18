class ComadsController < ApplicationController
  def show
    @comad = Comad.find(params[:id])
  end
end
