module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

     def connect
       self.current_user = user
     end

    def user
      if u = User.find_by(id: cookies.encrypted[:user_id])
        u
      else
        reject_unauthorized_connection
      end
    end
  end
end
