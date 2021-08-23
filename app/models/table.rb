class Table < ApplicationRecord
  validates :table_number, presence: true,
                           uniqueness: true
end
