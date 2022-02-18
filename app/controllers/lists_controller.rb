class ListsController < ApplicationController

  before_action :get_list, only: [:show, :delete]

  def index
    @lists = List.all
  end

  def show
    @bookmark = Bookmark.new
    @review = Review.new
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(params_list)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def delete
    @list = List.new(params_list)
    @list.destroy
    redirect_to lists_path
  end

  private

  def get_list
    @list = List.find(params[:id])
  end

  def params_list
    params.require(:list).permit(:name, :photo)
  end
end
