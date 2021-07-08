class Micropost < ApplicationRecord
    validates :context, length: {maximum:50}, presence: true
    belongs_to :user
end
