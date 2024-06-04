class BreedPolicy < ApplicationPolicy
    def create?
      user.admin? # Только администраторы могут создавать новые породы кошек
    end
  end
  