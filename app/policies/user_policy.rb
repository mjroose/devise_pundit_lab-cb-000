class UserPolicy < ApplicationPolicy
  def initialize(current_user, user)
    @current_user = current_user
    @user = user
  end

  def show?
    @current_user.admin? || @user == @current_user
  end

  def index?
    @current_user.admin?
  end

  def update?
    @current_user.admin?
  end

  def destroy?
    @current_user.admin? && @user != @current_user
  end
end
