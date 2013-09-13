require 'pry'
require 'faker'

@books = {}

1000.times do |book|
	title = Faker::Name.title
	author = Faker::Name.name
	num_pages = Faker::Number.number
	publishing_house = Faker::Company.name

	@books = { title => [author, num_pages, publishing_house] }
	p @books

end

@words = {}

1000.times do |word|
	word = Faker::Lorem.word
	meaning = Faker::Lorem.paragraph
	language = Faker::Lorem.word
	part_of_speech = Faker::Lorem.word

	@words = { word => [meaning, language, part_of_speech] }
	p @words

end