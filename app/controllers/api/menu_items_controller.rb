class Api::MenuItemsController < ApplicationController
  before_action :set_menu
  before_action :set_menu_item, except: [:create]

  def create
    @menu_item = @menu.menu_items.create(menu_item_params)
    if @menu_item.save
      render json: @menu_item
    else
      render json: { errors: @menu_item.errors }, status: 401
    end
  end

  def update
    if @menu_item.update(menu_item_params)
      render json: @menu_item
    else
      render json: { errors: @menu_item.errors }, status: 401
    end
  end

  def destroy
    @menu_item.destroy
  end

private

  def set_menu
    @menu = Menu.find(params[:menu_id])
  end

  def menu_item_params
    params.require(:menu_item).permit(:name, :description, :price)
  end

  def set_menu_item
    @menu_item = @menu.menu_items.find(params[:id])
  end

end
