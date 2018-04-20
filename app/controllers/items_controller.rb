class ItemsController < InheritedResources::Base
  before_action :authenticate_user! ,except: [:index, :show]
  
  def new
    @item = current_user.items.new
  end
  def edite
    @item = current_user.items.find(params[:id])
  end
  def create
    @item = current_user.items.new(item_params)
    if @item.save
      redirect_to @item, notice: "new item created"
    else
      render :new
    end
  end
  def update
    @item = current_user.items.find(params[:id])
    if @item.update(item_params)
      redirect_to @item, notice: "item updated"
    else
      render :edit
    end
  end
  def destroy
    @item = current_user.items.find(params[:id])
    @item.destroy
    redirect_to items_url , notice: "item destroyed"
  end

  private

    def item_params
      params.require(:item).permit(:title, :url, :text)
    end
end

