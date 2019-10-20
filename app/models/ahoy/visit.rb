# frozen_string_literal: true

class Ahoy::Visit < ApplicationRecord
  self.table_name = 'ahoy_visits'

  after_create :touch_visitor

  has_many :events, class_name: 'Ahoy::Event'
  has_one :visitor, foreign_key: :visitor_token, primary_key: :visitor_token
  belongs_to :user, optional: true

  private

  def touch_visitor
    Visitor.find_or_create_by(visitor_token: visitor_token).touch
  end
end
