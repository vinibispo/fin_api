# frozen_string_literal: true

class Account < ApplicationRecord
  validates :cpf, presence: true, uniqueness: true
  validates :name, presence: true
  has_many :statements, dependent: :destroy
end
