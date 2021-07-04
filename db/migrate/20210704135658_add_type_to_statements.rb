class AddTypeToStatements < ActiveRecord::Migration[6.1]
  def change
    add_column :statements, :type, :integer, default: 0
  end
end
