class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy, :soft_delete]
  skip_before_action :set_item, only: [:restore, :restore_items]

  def index
    @items = Item.all
  end

  def show
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to items_path, notice: 'Item was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to @item, notice: 'Item was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to items_url, notice: 'Item was successfully destroyed.'
  end

  def soft_delete
    @item.soft_delete
    redirect_to items_url, notice: 'Item was soft-deleted.'
  end

  def restore
    @soft_deleted_items = Item.unscoped.where.not(deleted_at: nil)
    if @soft_deleted_items.empty?
      flash.now[:notice] = 'No soft-deleted items found.'
    end
  end

  def restore_items
    items_to_restore = Item.unscoped.where(id: params[:item_ids])
    items_to_restore.update_all(deleted_at: nil)
    redirect_to items_url, notice: 'Items restored successfully.'
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name)
  end
end
