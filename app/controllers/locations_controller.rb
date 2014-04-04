class LocationsController < ApplicationController
  def index
    @locations = Location.all
    @location = Location.new
    render("locations/index.html.erb")
  end

  def create
    @location = Location.new(params[:location])
    if @location.save
      params[:location][:slug] = ("#{@location.id}-#{@location.city}-#{@location.state}").parameterize
      @location.update(params[:location])
      flash[:notice] = "Your location was added to TrailFinder."
      redirect_to("/locations")
    else
      flash[:alert] = "Try again, sucka!"
      redirect_to("/locations")
    end
  end

  def show
    @location = Location.find_by(slug: params[:location_slug])
    render("locations/show.html.erb")
  end

  def edit
    @location = Location.find_by(slug: params[:location_slug])
    render("locations/edit.html.erb")
  end

  def update
    @location = Location.find_by(slug: params[:location_slug])
    if @location.update(params[:location])
      flash[:notice] = "Your location was updated successfully."
      redirect_to("/locations/#{@location.slug}")
    else
      flash[:alert] = "Try again, silly"
      render("locations/edit.html.erb")
    end
  end

  def destroy
    @location = Location.find_by(slug: params[:location_slug])
    @location.delete
    redirect_to("/locations")
  end
end
