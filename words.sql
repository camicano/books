CREATE TABLE words (
	id serial primary key,
	word varchar(100) NOT NULL,
	book_id serial,
	FOREIGN KEY (book_id) REFERENCES books(id)
);