class Puppy < ActiveRecord::Base
	validates :name, :age, :breed, :bio, :image_url, presence: true
end
