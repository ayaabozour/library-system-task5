import 'package:lms/book.dart';
import 'package:lms/library.dart';
import 'package:lms/member.dart';

void main() {
  Library library = Library(
    books: [
      Book(title: "1984", author: "George Orwell", isAvailable: true),
      Book(
          title: "To Kill a Mockingbird",
          author: "Harper Lee",
          isAvailable: true),
      Book(
          title: "The Great Gatsby",
          author: "F. Scott Fitzgerald",
          isAvailable: false),
    ],
    members: [
      Member(name: "Alice", memberId: 1, borrowedBooks: []),
      Member(name: "Bob", memberId: 2, borrowedBooks: ["The Great Gatsby"]),
    ],
  );

  print('The library has the following books:');
  library.books.forEach((book) {
    print(
        'Title: ${book.title}, Author: ${book.author}, Available: ${book.isAvailable}');
  });

  print(' The library has the following members:');
  library.members.forEach((member) {
    print(
        'Name: ${member.name}, Member ID: ${member.memberId}, Borrowed Books: ${member.borrowedBooks}');
  });

  library.addBook(
      Book(title: "Moby", author: "Herman Melville", isAvailable: true));
  library.books.forEach((element) {
    print(
        'Title: ${element.title}, Author: ${element.author}, Available: ${element.isAvailable}');
  });

  library
      .registerMember(Member(name: "Charlie", memberId: 3, borrowedBooks: []));
  library.members.forEach((element) {
    print(
        'Name: ${element.name}, Member ID: ${element.memberId}, Borrowed Books: ${element.borrowedBooks}');
  });

  library.borrowBook("1984", 1);
  library.returnBook("The Great Gatsby", 2);
  library.books.forEach((element) {
    print(
        'Title: ${element.title}, Author: ${element.author}, Available: ${element.isAvailable}');
  });
}
