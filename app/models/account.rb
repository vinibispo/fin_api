# frozen_string_literal: true

# model for represent account table on database
class Account < ApplicationRecord
  validates :cpf, presence: true, uniqueness: true
  validates :name, presence: true
  has_many :statements, dependent: :destroy
end
