class Veiculo < ApplicationRecord
  validates :marca, :modelo, :ano, presence: true
end
