require 'sinatra'
require 'sinatra/reloader'
require 'active_record'
require 'active_support/all'

require_relative './models/book'
require_relative './models/word'

ActiveRecord::Base.establish_connection('postgres://localhost/dogs_and_toys')
 

ActiveRecord::Base.logger = Logger.new(STDOUT)

# SELECT * FROM "books";
get '/' do
	@books = Book.all
	erb :index
end

get '/books/new' do
	erb :new_book
end

# INSERT INTO "books" (title, author) VALUES (params[:book]);
post '/books/new' do
	book = Book.new(params[:book])
	book.save

	redirect "/books/#{book.id}/show"
end

# SELECT "books".* FROM "books" WHERE "books"."id" = (params[:book_id]) LIMIT 1;
get '/books/:book_id/show' do
	@book = Book.find(params[:book_id])
	erb :show
end

# SELECT "books".* FROM "books" WHERE "books"."id" = (params[:book_id]) LIMIT 1;
get '/books/:book_id/add_word' do
	@book = Book.find(params[:book_id])
	erb :add_word
end

# INSERT INTO "books" FROM "books" WHERE "books"."id" = (params[:book_id]) RETURNING "id";
# INSERT INTO "words" (book_id, word) VALUES (id, params[:word]) 
post '/books/:book_id/add_word' do
	book = Book.find(params[:book_id])

	word = book.words.new(params[:word])
	word.save

	redirect "/books/#{book.id}/show"
end

# SELECT "books".* FROM "books" WHERE "books"."id" = (params[:book_id]) LIMIT 1;
get '/books/:book_id/update' do
	@book = Book.find(params[:book_id])
	erb :update
end

# SELECT "books".* FROM "books" WHERE "books"."id" = (params[:book_id]) LIMIT 1;
# UPDATE "books" SET "title" = title, "author" = author WHERE "books"."id" = (params.[:book_id]);

post '/books/:book_id/update' do
	@book = Book.find(params[:book_id])
	title = params[:title]
	author = params[:author]
	
	@book.title = title
	@book.author = author
	@book.save!

	redirect "/books/#{@book.id}/show"
end

# SELECT "books".* FROM "books" WHERE "books"."id" = (params[:book_id]);
# DELETE FROM "books" WHERE "books"."id" = (params[:book_id]);
get '/books/:book_id/delete' do
	book = Book.find(params[:book_id])
	book.delete

	redirect "/"
end












