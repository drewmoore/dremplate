class Page < ActiveRecord::Base
  validates_uniqueness_of :controller, :scope => :action
end
