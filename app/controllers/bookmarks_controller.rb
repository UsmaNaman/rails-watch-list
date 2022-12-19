class BookmarksController < ApplicationController
  before_action :find_bookmark, only: :destroy
  before_action :find_list, only: %i[new create]

  def new
    @bookmark = Bookmark.new
    # @list = List.find(params[:list_id])
  end

  # def show
  #   @omdbapi_service = OmdbapiService.new
  # end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    # @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to root_path
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end

  def find_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def find_list
    @list = List.find(params[:list_id])
  end
end
