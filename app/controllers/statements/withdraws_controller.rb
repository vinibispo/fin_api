# frozen_string_literal: true

module Statements
  # controller for create withdraws
  class WithdrawsController < ApplicationController
    include AccountUtils
    before_action :set_account
    def create
      @withdraw = @account.statements.new(withdraw_params.merge(statement_type: 'withdraw'))
      if @withdraw.save
        render :show, status: :created
      else
        render json: @withdraw.errors, status: :unprocessable_entity
      end
    end

    private

    def withdraw_params
      params.require(:withdraw).permit(:description, :amount, statement_type: 1)
    end
  end
end
