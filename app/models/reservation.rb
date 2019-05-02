class Reservation < ApplicationRecord
    has_many :requests
    belongs_to :users
end
