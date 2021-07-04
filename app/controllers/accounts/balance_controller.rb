# frozen_string_literal: true

module Accounts
  # controller for see the current balance
  class BalanceController < ApplicationController
    include Statements::AccountUtils
    before_action :set_account, only: %i[index]
    def index
      @balance = @account.statements.balance
    end
  end
end
