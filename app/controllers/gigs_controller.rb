class GigsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @gigs = Gig.all
  end

  def show
    @gig = Gig.find(params[:id])
  end

  def new
    @gig = Gig.new
  end

  def edit
    @gig = Gig.find(params[:id])
  end

  def create
    @gig = Gig.new(gig_params)
    if @gig.save
      redirect_to @gig
    else
      render :new
    end
  end

  def update
    @gig = Gig.find(params[:id])
    if @gig.update(gig_params)
      redirect_to @gig
    else
      render :edit
    end
  end

  def destroy
    @gig = Gig.find(params[:id])
    @gig.destroy
    redirect_to gigs_path
  end

  private 
  def gig_params
    params.require(:gig).permit(:name, :date, :location, :description)
  end

end
