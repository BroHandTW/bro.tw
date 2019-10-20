# frozen_string_literal: true

# 使 model 有 created_date 可以用
module Functions::CreatedDate
  extend ActiveSupport::Concern
  included do
    before_create -> { self.created_date = created_at.to_date }, if: -> { self.class.created_date_funection? }
  end
end
