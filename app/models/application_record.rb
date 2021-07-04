# frozen_string_literal: true

# heart of models with persistence
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
