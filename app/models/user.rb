class User < ApplicationRecord
  has_many :messages

  def wait_key
    "wait_by_#{id}"
  end
end
