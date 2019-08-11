class Lot < ApplicationRecord
    validates :lot_name, presence: true, length: { maximum: 50 }
    validates :start_date, presence: true, length: { maximum: 50 }
    validates :bird_house, presence: true, length: { maximum: 50 }
    
    has_many :results
end
