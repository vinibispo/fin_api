# frozen_string_literal: true

module Statements
  # controller for create withdraws
  class WithdrawsController < ApplicationController
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

    def set_account
      cpf = request.headers['cpf']
      @account = Account.find_by(cpf: cpf)
      render json: { message: 'Account not found' }, status: :not_found if @account.blank?
    end

    def withdraw_params
      params.require(:withdraw).permit(:description, :amount, statement_type: 1)
    end
  end
end
