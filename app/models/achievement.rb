class Achievement < ActiveRecord::Base
  validates :title, :description, :image_url, :presence => true
  validates :points, :presence => true, :inclusion => {:in => 1..100}
end
