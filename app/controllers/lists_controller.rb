class ListsController < ApplicationController
  before_action :find_list, only: %i[show destroy]

  def index
    @lists = List.all
  end

  def show
    # @list = List.find(params[:id])
    @bookmark = Bookmark.new
    @review = Review.new(list: @list)
    # @omdbapi_service = OmdbapiService.new
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @list.destroy
    redirect_to root_path, notice: "List was successfully destroyed."
  end

  private

  def list_params
    params.require(:list).permit(:name, :photo)
  end

  def find_list
    @list = List.find(params[:id])
  end
end
