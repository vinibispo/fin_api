# frozen_string_literal: true

module Statements
  # controller for create debosit
  class DepositsController < ApplicationController
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

    def set_account
      cpf = request.headers['cpf']
      @account = Account.find_by(cpf: cpf)
      render json: { message: 'Account not found' }, status: :not_found if @account.blank?
    end

    def deposit_params
      params.require(:deposit).permit(:description, :amount, statement_type: 'deposit')
    end
  end
end
