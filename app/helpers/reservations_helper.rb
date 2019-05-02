module ReservationsHelper
    
    def reserved_check(date,frame)
        if Reservation.find_by(reserved_date: date, reserved_space: frame)
            reservation = Reservation.find_by(reserved_date: date, reserved_space: frame)
            return reservation
        end
    end
end
