module Accounts
  class BalanceController < ApplicationController
    before_action :set_account, only: %i[index]
    def index
      @balance = @account.statements.balance
    end

    private

    def set_account
      cpf = request.headers['cpf']
      @account = Account.find_by(cpf: cpf)
      render json: { message: 'Account not found' }, status: :not_found unless @account.present?
    end
  end
end
