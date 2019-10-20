# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  include Functions::CreatedDate

  # cache model 本身有 created_at 功能
  def self.created_date_funection?
    return @created_date_funection unless @created_date_funection.nil?

    @created_date_funection = table_name && column_names.include?('created_date')
  end
end
