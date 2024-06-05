class BreedPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        # Если пользователь не администратор, то возвращаем пустой запрос,
        # чтобы скрыть все породы кошек.
        scope.none
      end
    end
  end

  # Остальные методы политики оставляем как есть.
  def new?
    user.admin?
  end

  def create?
    user.admin?
  end

  def edit?
    user.admin?
  end

  def update?
    user.admin?
  end

  def destroy?
    user.admin?
  end
end
