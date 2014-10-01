class Page < ActiveRecord::Base
  validates_uniqueness_of :controller, :scope => :action
  has_and_belongs_to_many :contents, :join_table => :contents_pages
end
