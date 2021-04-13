class User < ApplicationRecord
    has_many :events
    has_many :invitations 
    has_many :guests, through: :invitation
end
