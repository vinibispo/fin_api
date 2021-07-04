class StatementsController < ApplicationController
  before_action :set_account
  def index
    if params[:date].present?
      find_statements_by_date
    else
      @statements = @account.statements
    end
  end

  private

  def set_account
    cpf = request.headers['cpf']
    @account = Account.find_by(cpf: cpf)
    render json: { message: 'Account not found' }, status: :not_found unless @account.present?
  end

  def find_statements_by_date
    @statements = @account.statements.starting_on(params[:date])
  end
end
