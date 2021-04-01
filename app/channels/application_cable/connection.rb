module ApplicationCable
  class Connection < ActionCable::Connection::Base

    identified_by :current_user

    def connect
      reject_unauthorized_connection unless find_verified_user
    end

    protected

    def find_verified_user
      self.current_user = env["warden"].user
        current_user
    end
  end
end
