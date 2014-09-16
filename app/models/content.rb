class Content < ActiveRecord::Base
  validates_format_of :identifier, with: /\A^\S+$\z/, on: :create
end
