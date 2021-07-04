class Statement < ApplicationRecord
  scope :balance, -> { deposit.sum(:amount) - withdraw.sum(:amount) }
  scope :starting_on, ->(date) { where(created_at: Date.parse(date).beginning_of_day..Date.parse(date).end_of_day) }
  belongs_to :account
  enum statement_type: %i[deposit withdraw]
  validate :cash?

  validates :description, :amount, presence: true

  private

  def cash?
    errors.add(:amount, 'Insufficient funds') if withdraw? && (account.statements.balance < amount)
  end
end
