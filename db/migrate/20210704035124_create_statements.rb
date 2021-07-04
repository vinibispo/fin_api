class CreateStatements < ActiveRecord::Migration[6.1]
  def change
    create_table :statements, id: :uuid do |t|
      t.string :description
      t.decimal :amount
      t.references :account, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
