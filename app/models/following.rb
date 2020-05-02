class Following < ApplicationRecord
    belongs_to :pet, optional: true
    belongs_to :user, optional: true
end
