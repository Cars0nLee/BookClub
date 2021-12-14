package com.cl.bookclub.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.cl.bookclub.models.Book;
import com.cl.bookclub.repositories.BookRepo;

@Service
public class BookService {
	
	private final BookRepo bookRepo;
	
	public BookService(BookRepo bookRepo) {
		this.bookRepo = bookRepo;
	}
	
	///// Create book
	public Book saveBook(Book book) {
		return bookRepo.save(book);
	}
	
	///// Get all books
	public List<Book> getAllBooks() {
		return bookRepo.findAll();
	}
	
	///// Find book by id
	public Book findBook(Long id) {
		Optional<Book> book = bookRepo.findById(id);
		if(book.isPresent()) {
			return book.get();
		}
		else {
			return null;
		}
	}
}
