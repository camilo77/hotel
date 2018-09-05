class Membership < ApplicationRecord
    has_many :guests
    
    validates :nombre, uniqueness: true
    validates :nombre, presence: true
    validates :discount, presence: true
    validates :nombre, inclusion: { in: [ "oro", "platino", "bronce" ] }
end
