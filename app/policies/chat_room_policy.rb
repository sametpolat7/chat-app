class ChatRoomPolicy < ApplicationPolicy

  def show?
    user.Premium?
  end

  def create?
    user.Premium?
  end

  class Scope < ApplicationPolicy::Scope

  end
end
