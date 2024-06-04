class BreedsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_breed, only: [:show, :edit, :update, :destroy]

    def index
      @breeds = policy_scope(Breed)
    end

    def show
      authorize @breed
    end

    def new
      @breed = Breed.new
      authorize @breed
    end

    def create
      @breed = Breed.new(breed_params)
      authorize @breed
      if @breed.save
        redirect_to root_path, notice: 'Breed was successfully created.'
      else
        render :new
      end
    end
  
    def edit
      authorize @breed
    end
  
    def update
      authorize @breed
      if @breed.update(breed_params)
        redirect_to @breed, notice: 'Breed was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      authorize @breed
      @breed.destroy
      redirect_to breeds_url, notice: 'Breed was successfully destroyed.'
    end
  
    private
  
    def set_breed
      @breed = Breed.find(params[:id])
    end
  
    def breed_params
      params.require(:breed).permit(:name)
    end
  end
  