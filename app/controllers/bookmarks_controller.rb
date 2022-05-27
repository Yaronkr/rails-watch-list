class BookmarksController < ApplicationController

  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(list_params)
    @movie = Movie.find(list_params[:movie_id])
    @bookmark.list = @list
    @bookmark.movie = @movie
    if @bookmark.save
      redirect_to list_path(@list), notice:"You seccessful"
    else
      render :new
    end
  end

  def destroy
    # @list = List.find(params[:id])
    # @movie = Movie.find(params[:list_id])
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list)
  end

  private

  def list_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end

end
