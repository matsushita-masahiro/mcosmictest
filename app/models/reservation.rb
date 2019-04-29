class Reservation < ApplicationRecord
    has_many :requests
end
