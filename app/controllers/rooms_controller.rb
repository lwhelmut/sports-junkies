class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :destroy, :update, :edit]

  def index
    @rooms = Room.all
    @room = Room.new
  end

  def new
    @room = Room.new
  end

  def show
    @rooms = Room.all
    render 'index'
  end

  def edit
  end

  def create
    @room = Room.new(room_params)

    respond_to do |format| 
      if @room.save
        format.html { redirect_to @room, notice: 'Room was successfully created.' }
        format.json { render :show, status: :created, location: @room }
      else
        format.html { render :new }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to @room, notice: 'Room was successfully updated.' }
        format.json { render :show, status: :ok, location: @room }
      else
        format.html { render :edit }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @room = Room.find(params[:id])
    respond_to do |format|
      if @room.destroy
        format.html { redirect_to rooms_url, notice: 'Room was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private

  def set_room
    @room = Room.find(params[:id])
  end

  def room_params
    params.require(:room).permit(:name)
  end

end
