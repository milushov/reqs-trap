class Trap < ActiveRecord::Base
  has_many :requests, -> { order(created_at: :desc) }
end
