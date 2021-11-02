class ChatRoom < ApplicationRecord
  has_many :messages

  def users
    User.all
  end
end
