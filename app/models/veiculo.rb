class Veiculo < ApplicationRecord
  validates :marca, :veiculo, :ano, presence: true
end
