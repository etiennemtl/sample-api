class Api::V1::FinestsController < ApplicationController

  def index
    finests = Finest.order(created_at: :desc)
    render json: finests
  end

  def show
    finest = Finest.find(params[:id])
    render json: finest
  end

  def create
    finest = Finest.new(finest_params.merge(user_id: current_user.id))

    if finest.save
      render json: finest, status: :created, location: [:api, finest]
    else
      render json: finest.errors, status: :unprocessable_entity
    end
  end

  def update
    finest = Finest.find(params[:id])

    if finest.update_attributes(finest_params)
      render json: finest, status: :ok
    else
      render json: finest.errors, status: :unprocessable_entity
    end
  end

  private

  def finest_params
    params.require(:finest).permit(:title)
  end

end