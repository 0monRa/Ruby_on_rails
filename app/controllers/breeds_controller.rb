class BreedsController < ApplicationController
  before_action :set_breed, only: [:edit, :update, :destroy]
  before_action :authenticate_admin!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @breeds = policy_scope(Breed)
  end

  def new
    authorize Breed
    @breed = Breed.new
  end

  def create
    @breed = Breed.new(breed_params)
    authorize @breed
    
    if @breed.save
      redirect_to breeds_path, notice: 'Breed was successfully created.'
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
      redirect_to breeds_path, notice: 'Breed was successfully updated.'
    else
      render :edit
    end
  end
  
  def destroy
    authorize @breed
  
    # Находим все коты с этой породой и обновляем их ассоциацию
    Cat.where(breed_id: @breed.id).update_all(breed_id: nil)
  
    # Удаляем саму породу
    @breed.destroy
  
    # Перенаправляем пользователя на страницу со всеми породами
    redirect_to breeds_path, notice: 'Breed was successfully deleted.'
  end

  private

  def set_breed
    @breed = Breed.find(params[:id])
  end

  def breed_params
    params.require(:breed).permit(:name)
  end

  def authenticate_admin!
    redirect_to(root_path) unless current_user&.admin?
  end
end
