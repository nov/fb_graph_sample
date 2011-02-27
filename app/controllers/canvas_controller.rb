class CanvasController < ApplicationController
  def create
    render :text => params.inspect
  end
end
