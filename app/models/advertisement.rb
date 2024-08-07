# class Advertisement < ApplicationRecord
#   belongs_to :user
# end

class Advertisement < ApplicationRecord
  belongs_to :user

  # Validations can be added here if needed
  validates :title, presence: true
  validates :body, presence: true
end
