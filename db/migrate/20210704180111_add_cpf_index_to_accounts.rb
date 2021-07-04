# frozen_string_literal: true

class AddCpfIndexToAccounts < ActiveRecord::Migration[6.1]
  def change
    add_index :accounts, :cpf
  end
end
