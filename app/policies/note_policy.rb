class NotePolicy < ApplicationPolicy
  def initialize(current_user, user)
    @current_user = current_user
    @user = user
  end

  def index?
    true
  end
end