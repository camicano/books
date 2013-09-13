class Book < ActiveRecord::Base
	has_many :words
end