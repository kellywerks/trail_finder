class TagsController < ApplicationController
  def index
    @tags = Tag.all
    @tag = Tag.new
    render("tags/index.html.erb")
  end

  def create
    @tag = Tag.new(params[:tag])
    if @tag.save
      params[:tag][:slug] = ("#{@tag.id}-#{@tag.name}").parameterize
      @tag.update(params[:tag])
      flash[:notice] = "Your tag was added to TrailFinder."
      redirect_to("/tags")
    else
      flash[:alert] = "Try again, sucka!"
      redirect_to("/tags")
    end
  end

  def show
    @tag = Tag.find_by(slug: params[:tag_slug])
    render("tags/show.html.erb")
  end

  def edit
    @tag = Tag.find_by(slug: params[:tag_slug])
    render("tags/edit.html.erb")
  end

  def update
    @tag = Tag.find_by(slug: params[:tag_slug])
    if @tag.update(params[:tag])
      flash[:notice] = "Your tag was updated successfully."
      redirect_to("/tags/#{@tag.slug}")
    else
      flash[:alert] = "Try again, silly"
      render("tags/edit.html.erb")
    end
  end

  def destroy
    @tag = Tag.find_by(slug: params[:tag_slug])
    @tag.delete
    redirect_to("/tags")
  end
end
