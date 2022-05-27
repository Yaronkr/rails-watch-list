class BookmarksController < ApplicationController

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(list_params)
    @list = List.find(params[:list_id])
    # @movie = Movie.find(params[:movie_id])
    @bookmark.list = @list
    # @bookmark.movie = @movie
    if @bookmark.save
      redirect_to lists_index_path, notice:"You seccessful"
    else
      render :new
    end
  end

  def destroy
    @list = List.find(params[:list_id])
    @list.destroy
    redirect_to lists_index_path
  end

  private

  def list_params
    params.require(:bookmark).permit(:comment)
  end

end
