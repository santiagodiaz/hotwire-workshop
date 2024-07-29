# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  include ActiveStorageSupport::SupportForBase64
  include Ransackable
  RANSACK_ATTRIBUTES = ['id'].freeze

  self.abstract_class = true
end
