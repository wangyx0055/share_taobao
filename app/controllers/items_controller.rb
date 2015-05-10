class ItemsController < ApplicationController

  def create
    @item = Item.create(params.require(:item).permit(:url))
    if @item.errors.any?
      render :new
    else
      redirect_to item_path @item
    end

  end

  def show
    weixin_agent?
    @item = Item.magic_find(params[:id])  
    # unless weixin_agent?
    #   # 做访问统计工作
    #   return redirect_to @item.url 
    # end
  end

end