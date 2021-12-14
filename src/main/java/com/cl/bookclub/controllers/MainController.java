package com.cl.bookclub.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cl.bookclub.models.Book;
import com.cl.bookclub.models.LoginUser;
import com.cl.bookclub.models.User;
import com.cl.bookclub.services.BookService;
import com.cl.bookclub.services.UserService;


@Controller
public class MainController {
	
	private UserService userServ;
	private BookService bookServ;
	
	public MainController(UserService userServ, BookService bookServ) {
		this.userServ = userServ;
		this.bookServ = bookServ;
	}
	
	@RequestMapping("/")
	public String index(Model model) {
		model.addAttribute("newUser", new User());
		model.addAttribute("newLogin", new LoginUser());
		return "index.jsp";
	}
	
	///// Register
	@PostMapping("/register")
	public String register(@Valid @ModelAttribute("newUser") User newUser, BindingResult result, Model model, HttpSession session) {
		userServ.register(newUser, result);
		if(result.hasErrors()) {
			model.addAttribute("newLogin", new LoginUser());
			return "index.jsp";
		}
		session.setAttribute("user_id", newUser.getId());
		return "redirect:/dash";
	}
	
	///// Login
	@PostMapping("/login")
	public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, BindingResult result, Model model, HttpSession session) {
		User user = userServ.login(newLogin, result);
		if(result.hasErrors()) {
			model.addAttribute("newUser", new User());
			return "index.jsp";
		}
		session.setAttribute("user_id", user.getId());
		return "redirect:/dash";
	}
	
	///// Dash
	@RequestMapping("/dash")
	public String dash(HttpSession session, Model model, RedirectAttributes flash) {
		Long userId = (Long) session.getAttribute("user_id");
		if(userId==null) {
			flash.addFlashAttribute("dash", "Please login or register before entering!");
			return "redirect:/";
		}
		User user = userServ.getUserInfo(userId);
		List<Book> books = bookServ.getAllBooks();
		model.addAttribute("books", books);
		model.addAttribute("loggedUser", user);
		return "home.jsp";
	}
	
	///// Create a book
	@GetMapping("/add")
	public String addBook(HttpSession session, RedirectAttributes flash, Model model) {
		Long userId = (Long) session.getAttribute("user_id");
		if(userId == null) {
			flash.addFlashAttribute("login", "Please login or register before entering!");
			return "redirect:/";
		}
		model.addAttribute("userId", userId);
		model.addAttribute("book", new Book());
		return "create.jsp";
	}
	
	@PostMapping("/create")
	public String createBook(@Valid @ModelAttribute("book") Book book, BindingResult result) {
		if(result.hasErrors()) {
			return "create.jsp";
		}
		else {
			bookServ.saveBook(book);
			return  "redirect:/dash";
		}
	}
	
	///// Edit page
	@GetMapping("/edit/{id}")
	public String editBook(@PathVariable("id") Long id, Model model, HttpSession session, RedirectAttributes flash) {
		Long userId = (Long) session.getAttribute("user_id");
		if(userId== null) {
			flash.addFlashAttribute("dash", "Please login or register before entering!");
			return "redirect:/";
		}
		Book book = bookServ.findBook(id);
		if(book.getUser().getId().equals(userId)) {
			model.addAttribute("book", book);
			return "edit.jsp";
		}
		flash.addFlashAttribute("dash", "Must be the user to edit!");
		return "redirect:/dash";
		
		
	}
	
	///// Update
	@PutMapping("/update/{id}")
	public String updateBook(@Valid @ModelAttribute("book") Book book, BindingResult result) {
		if(result.hasErrors()) {
			return "edit.jsp";
		}
		else {
			bookServ.saveBook(book);
			return "redirect:/dash";
		}
	}
	
	///// View
	@RequestMapping("/view/{id}")
	public String view(@PathVariable("id") Long id, Model model) {
		Book book = bookServ.findBook(id);
		model.addAttribute("book", book);
		return "view.jsp";
	}
	
	///// Logout
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
}
