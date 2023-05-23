// Iterator interface
abstract class Iterator<T> {
  bool hasNext();
  T next();
}

// Aggregate interface
abstract class Aggregate<T> {
  Iterator<T> createIterator();
}

// Concrete Iterator
class BookIterator implements Iterator<Book> {
  List<Book> books;
  int currentIndex = 0;

  BookIterator(this.books);

  @override
  bool hasNext() {
    return currentIndex < books.length;
  }

  @override
  Book next() {
    final book = books[currentIndex];
    currentIndex++;
    return book;
  }
}

// Concrete Aggregate
class BookCollection implements Aggregate<Book> {
  List<Book> books = [];

  void addBook(Book book) {
    books.add(book);
  }

  @override
  Iterator<Book> createIterator() {
    return BookIterator(books);
  }
}

// Book class
class Book {
  String title;

  Book(this.title);
}
