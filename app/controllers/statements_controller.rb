# frozen_string_literal: true

# controller for statements
class StatementsController < ApplicationController
  include Statements::AccountUtils
  before_action :set_account
  def index
    if params[:date].present?
      find_statements_by_date
    else
      @statements = @account.statements
    end
  end

  private

  def find_statements_by_date
    @statements = @account.statements.starting_on(params[:date])
  end
end
