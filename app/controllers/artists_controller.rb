class ArtistsController < ApplicationController
  before_action :set_artist, :only => [:show, :edit, :update]

  def index
    @artists = Artist.order('name')
  end

  def show
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)
    if @artist.valid?
      @artist.save
      redirect_to artist_path(@artist)
    else
      flash[:errors] = @artist.errors.full_messages
      redirect_to new_artist_path
    end
  end

  def update
    @artist.add_instrument(Instrument.find(artist_params[:id].to_i))
    redirect_to artist_path(@artist)
  end

  private
  def artist_params
    params.require(:artist).permit(:name, :age, :title, :id)
  end

  def set_artist
    @artist = Artist.find(params[:id])
  end

end
