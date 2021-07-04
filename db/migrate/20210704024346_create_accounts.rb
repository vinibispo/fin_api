class CreateAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :accounts, id: :uuid do |t|
      t.string :cpf
      t.string :name

      t.timestamps
    end
  end
end
