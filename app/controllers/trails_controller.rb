class TrailsController < ApplicationController
  def index
    @trails = Trail.all
    @trail = Trail.new
    render("trails/index.html.erb")
  end

  def create
    @trail = Trail.new(params[:trail])
    if @trail.save
      params[:trail][:slug] = ("#{@trail.id}-#{@trail.name}").parameterize
      @trail.update(params[:trail])
      flash[:notice] = "Your trail was added to TrailFinder."
      redirect_to("/trails/#{@trail.slug}")
    else
      flash[:alert] = "Try again, sucka!"
      redirect_to("/trails")
    end
  end

  def show
    @trail = Trail.find_by(slug: params[:trail_slug])
    render("trails/show.html.erb")
  end

  def edit
    @trail = Trail.find_by(slug: params[:trail_slug])
    render("trails/edit.html.erb")
  end

  def update
    @trail = Trail.find_by(slug: params[:trail_slug])
    if @trail.update(params[:trail])
      flash[:notice] = "Your trail was updated successfully"
      redirect_to("/trails/#{@trail.slug}")
    else
      flash[:alert] = "Try again, silly"
      render("trails/edit.html.erb")
    end
  end

  def destroy
    @trail = Trail.find_by(slug: params[:trail_slug])
    @trail.destroy
    redirect_to("/trails")
  end
end
