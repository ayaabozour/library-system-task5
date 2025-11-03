import 'book.dart';
import '../../member.dart';

class Library {
  List<Book> books = [];
  List<Member> members = [];

  Library({required this.books, required this.members});

  void addBook(Book book) {
    books.add(book);
    print('Book "${book.title}" added to the library.');
  }

  void registerMember(Member member) {
    members.add(member);
    print('Member "${member.name}" registered with ID ${member.memberId}.');
  }

  void borrowBook(String title, int memberId) {
    Book? book = books.firstWhere(
      (b) => b.title == title && b.isAvailable,
    );
    Member? member = members.firstWhere(
      (m) => m.memberId == memberId,
    );

    if (book != null && member != null) {
      book.isAvailable = false;
      member.borrowedBooks.add(book.title);
      print(
          "Book ${book.title} borrowed successfully by the member with id ${member.memberId}.");
    } else {
      print("Book ${book.title} is not available.");
    }
  }

  void returnBook(String title, int memberId) {
    Book? book = books.firstWhere(
      (b) => b.title == title && !b.isAvailable,
    );
    Member? member = members.firstWhere(
      (m) => m.memberId == memberId,
    );

    if (book != null &&
        member != null &&
        member.borrowedBooks.contains(book.title)) {
      book.isAvailable = true;
      member.borrowedBooks.remove(book.title);
      print("Book ${book.title} returned successfully by the member with id ${member.memberId}.");
      
    } else {
      print("Return failed. try again later.");
    }
  }
}
