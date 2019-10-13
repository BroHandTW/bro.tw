# frozen_string_literal: true

(1..5).each do |j|
  admin_str = "aa00#{j}@bro.tw"
  Admins.create email: admin_str, password: admin_str
  user_str = "uu00#{j}@bro.tw"
  Users.create email: user_str, password: user_str
end
puts ' === db:seed done === '
