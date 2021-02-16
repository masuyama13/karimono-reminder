# frozen_string_literal: true

class BorrowingThingsController < ApplicationController
  before_action :set_borrowing_thing, only: [:show, :edit, :update, :destroy]

  def index
    @borrowing_things = BorrowingThing.all
  end

  def show
  end

  def new
    @borrowing_thing = BorrowingThing.new
end

  def edit
  end

  def create
    @borrowing_thing = BorrowingThing.new(borrowing_thing_params)

    if @borrowing_thing.save
      redirect_to @borrowing_thing, notice: "Borrowing thing was successfully created."
    else
      render :new
    end
  end

  def update
    if @borrowing_thing.update(borrowing_thing_params)
      redirect_to @borrowing_thing, notice: "Borrowing thing was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @borrowing_thing.destroy
    redirect_to borrowing_things_url, notice: "Borrowing thing was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_borrowing_thing
      @borrowing_thing = BorrowingThing.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def borrowing_thing_params
      params.require(:borrowing_thing).permit(:name, :borrow_from, :borrowed_on, :remind_on)
    end
end
