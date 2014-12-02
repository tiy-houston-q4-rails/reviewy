class Authorization < ActiveRecord::Base
  belongs_to :user

  scope :facebook, -> { find_by provider: 'facebook'}
  scope :github,   -> { find_by provider: 'github'}
end
