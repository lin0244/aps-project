class PositionsController < ApplicationController
  respond_to :json

  def index
    @positions = Position.all.to_a
    respond_success_json_data(@positions.to_json, {info: 'positions index'})
  end

end