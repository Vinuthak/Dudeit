class StoriesController < ApplicationController
  def index
    #@story = Story.order('RANDOM()').first
    @stories = Story.all
  end

  def new
    @story = Story.new
  end

  def create
    @story = Story.new(story_params)
    if @story.save
      flash[:notice] = "Story submission succeeded"
      redirect_to stories_path
    else
      render action:'new'
    end  
  end

  def show
    @story = Story.find(params[:id])
  end

  private
  def story_params
    params.require(:story).permit(:name,:link)
  end
end
