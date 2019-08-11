class Result < ApplicationRecord
  belongs_to :lot
  belongs_to :user
  
    validates :date, presence: true, length: { maximum: 50 }
    validates :egg_count, presence: true, length: { maximum: 50 }
    validates :egg_weight, presence: true, length: { maximum: 50 }
    validates :bird_dead, presence: true, length: { maximum: 50 }
    validates :rate, presence: true, length: { maximum: 50 }
    
    before_save { 
      lot = self.lot
      self.rate = (lot.bird_house - self.bird_dead).to_f / lot.bird_house.to_f
    }

end
