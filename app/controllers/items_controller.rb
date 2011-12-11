class ItemsController < ApplicationController
  before_filter :authenticate, :only => [:create, :destroy]
  before_filter :authorized_user, :only => :destroy
  def create
    @item = current_user.items.build(params[:item])
    if @item.save
    flash[:success] = "Item created!"
    redirect_to root_path
    else
    render 'pages/home'
    end
  end

  def index
    @items = Item.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @items }
    end
  end

  def edit
    @item = Item.find(params[:id])
    @title = "Edit item"
  end

  def show
    @item = Item.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @item }
    end
  end

  def update
    @item = Item.find(params[:id])

    respond_to do |format|
      if @item.update_attributes(params[:item])
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @item.destroy
    redirect_back_or root_path
  end

  private

  def authorized_user
    @item = Item.find(params[:id])
    redirect_to root_path unless current_user?(@item.user)
  end
end