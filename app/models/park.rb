class Park <  ApplicationRecord
  validates :name, presence: :true
  validates :managed_by, presence: :true
  validates :description, presence: :true
end