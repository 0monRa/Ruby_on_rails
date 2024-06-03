class CatController < ApplicationController
    def show
      @cat = Cat.find(params[:id])
    end
  
    def new_cat
      @cat = Cat.new
    end
  
    def create
      @cat = Cat.new(cat_params)
      if @cat.save
        redirect_to @cat, notice: 'Cat was successfully created.'
      else
        render :new
      end
    end
  
    def edit
      @cat = Cat.find(params[:id])
    end
  
    def update
      @cat = Cat.find(params[:id])
      if @cat.update(cat_params)
        redirect_to @cat, notice: 'Cat was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @cat = Cat.find(params[:id])
      @cat.destroy
      redirect_to cats_url, notice: 'Cat was successfully destroyed.'
    end
  
    private
  
    def cat_params
      params.require(:cat).permit(:name, :breed_id, :path)
    end
  end
  