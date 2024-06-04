class CatsController < ApplicationController
  before_action :authenticate_user! # Предполагая, что у вас есть аутентификация пользователей
  before_action :set_cat, only: [:show, :edit, :update, :destroy]

  def index
    @cats = policy_scope(Cat)
    @cat = Cat.new
  end

  def show
    @cat = Cat.find(params[:id])
    authorize @cat
  end

  def new
    @cat = Cat.new
    authorize @cat
  end

  def create
    @cat = Cat.new(cat_params)
    authorize @cat
    if @cat.save
      redirect_to @cat, notice: 'Cat was successfully created.'
    else
      render :new
    end
  end

  def edit
    authorize @cat
  end

  def update
    authorize @cat
    if @cat.update(cat_params)
      redirect_to @cat, notice: 'Cat was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    authorize @cat
    @cat.destroy
    redirect_to cats_url, notice: 'Cat was successfully destroyed.'
  end

  private

  def set_cat
    @cat = Cat.find(params[:id])
  end

  def cat_params
    params.require(:cat).permit(:name, :breed_id) # Удалите :path отсюда
  end
end
