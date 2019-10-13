# frozen_string_literal: true

module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
    end

    protected

    def find_verified_user
      user_id = cookies.encrypted['user.id']
      return User.find_by(id: user_id) if user_id.present?

      admin_id = cookies.encrypted['admin.id']
      return Admin.find_by(id: admin_id) if admin_id.present?

      # reject_unauthorized_connection
      nil
    end
  end
end
