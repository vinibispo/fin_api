# frozen_string_literal: true

require 'test_helper'

class AccountTest < ActiveSupport::TestCase
  test 'should not save account without name' do
    account = Account.new(cpf: '3333333')
    assert_not account.save
  end

  test 'should not save account without cpf' do
    account = Account.new(name: 'John Doe')
    assert_not account.save
  end

  test 'should not save account with a repeated cpf' do
    account_1 = Account.create(name: 'John Doe', cpf: '333333333')
    account_2 = Account.new(name: 'John', cpf: '333333333')
    assert_not account_2.save
  end
end
