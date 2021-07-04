# frozen_string_literal: true

class RenameTypeToStatementTypeOnStatements < ActiveRecord::Migration[6.1]
  def change
    rename_column :statements, :type, :statement_type
  end
end
