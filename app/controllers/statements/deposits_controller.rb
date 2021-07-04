# frozen_string_literal: true

module Statements
  # controller for create debosit
  class DepositsController < ApplicationController
    include AccountUtils
    before_action :set_account
    def create
      @deposit = @account.statements.new(deposit_params)
      if @deposit.save
        render :show, status: :created
      else
        render json: @deposit.errors, status: :unprocessable_entity
      end
    end

    private

    def deposit_params
      params.require(:deposit).permit(:description, :amount, statement_type: 'deposit')
    end
  end
end
