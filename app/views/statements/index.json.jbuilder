# frozen_string_literal: true

json.array! @statements, partial: 'statements/statement', as: :statement
