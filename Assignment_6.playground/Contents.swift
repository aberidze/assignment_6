/* --------------- TASK 1 _ Simulating Library --------------- */
// Subtask 1: class Book
class Book {
    var bookID: Int
    var title: String
    var author: String
    var isBorrowed: Bool
    
    // Designated initializer:
    init(bookID: Int, title: String, author: String, isBorrowed: Bool) {
        self.bookID = bookID
        self.title  = title
        self.author = author
        self.isBorrowed = isBorrowed
    }
    
    // Method that checks book as borrowed:
    func checkAsBorrowed() {
        print("Borrowing '\(title)' by \(author)...")
        if !isBorrowed {
            isBorrowed = true
            print("Book successfully borrowed!")
        } else {
            print("Book not available!")
        }
    }
    
    // Method that checks book as returned:
    func checkAsReturned() {
        print("Returning '\(title)' by \(author)...")
        if isBorrowed {
            isBorrowed = false
            print("Book successfully returned!")
        } else {
            print("Unsuccessful. Book was not borrowed from us!")
        }
    }
}

// Subtask 2: class Owner
class Owner {
    var ownerID: Int
    var name: String
    var borrowedBooks: [Book]
    
    // Designated initializer:
    init(ownerID: Int, name: String, borrowedBooks: [Book]) {
        self.ownerID = ownerID
        self.name = name
        self.borrowedBooks = borrowedBooks
    }
    
    // Method that allows to borrow book:
    func borrowBookByUser(book: Book) {
        if borrowedBooks.contains(where: { $0.bookID == book.bookID }) {
            print("You've already borrowed '\(book.title)'")
        } else {
            borrowedBooks.append(book)
            print("You're allowed to borrow '\(book.title)'!")
        }
    }
    
    // Method that allows to return book:
    func returnBookByUser(book: Book) {
        if let index = borrowedBooks.firstIndex(where: { $0.bookID == book.bookID }) {
            borrowedBooks.remove(at: index)
            print("You can return '\(book.title)'.")
        } else {
            print("You have not borrowed '\(book.title)'")
        }
    }
}

// Subtask 3: class Library
class Library {
    var books: [Book]
    var owners: [Owner]
    
    // Designated initializer:
    init(books: [Book], owners: [Owner]) {
        self.books = books
        self.owners = owners
    }
    
    // Method for adding book in a library:
    func addBook(book: Book) {
        books.append(book)
    }
    
    // Method for adding owner in a library:
    func addOwner(owner: Owner) {
        owners.append(owner)
    }
    
    // Method that finds and returns all the available books:
    func findAvailableBooks() -> [Book] {
        return books.filter { !$0.isBorrowed }
    }
    
    // Method that finds and returns all the unavailable books:
    func findUnavailableBooks() -> [Book] {
        return books.filter { $0.isBorrowed }
    }
    
    // Method that finds and returns owner with its ID:
    func findOwnerWithID(ownerID: Int) -> Owner? {
        for owner in owners {
            if owner.ownerID == ownerID {
                return owner
            }
        }
        
        print("Owner with this ID does NOT exist!")
        return nil
    }
    
    // Method that searches for borrowed books according to owner:
    func booksBorrowedBy(owner: Owner) -> [Book] {
        return owner.borrowedBooks
    }
    
    // Method that allows owner to borrow available book:
    func canBorrowBook(owner: Owner, book: Book) {
        
    }
}

// Subtask 4: library simulation
print("Library simulation")
print("-----------------------------------")
var harryPotter = Book(bookID: 1,
                       title: "Harry Potter and the Philosopher's Stone",
                       author: "J. K. Rowling",
                       isBorrowed: false)
var mockingbird = Book(bookID: 2,
                       title: "To Kill a Mockingbird",
                       author: "Harper Lee",
                       isBorrowed: false)
var nineteenEighyFour = Book(bookID: 3,
                             title: "1984",
                             author: "George Orwell",
                             isBorrowed: false)
var donQuixote = Book(bookID: 4,
                      title: "Don Quixode",
                      author: "Miguel de Cervantes",
                      isBorrowed: false)

var owner1 = Owner(ownerID: 1,
                   name: "George Johnson",
                   borrowedBooks: [])
var owner2 = Owner(ownerID: 2,
                   name: "Paul Davidson",
                   borrowedBooks: [donQuixote])
var owner3 = Owner(ownerID: 3,
                   name: "Curtis Jackson",
                   borrowedBooks: [nineteenEighyFour, mockingbird])

var library = Library(books: [], owners: [])
library.addBook(book: harryPotter)
library.addBook(book: mockingbird)
library.addBook(book: nineteenEighyFour)
library.addBook(book: donQuixote)
library.addOwner(owner: owner1)
library.addOwner(owner: owner2)
library.addOwner(owner: owner3)

print("Book borrowing and returning simulation:")
print("\n")

print("Unavailable Books:")
for book in library.findUnavailableBooks() {
    print("'\(book.title)' by \(book.author)")
}
print("\n")
print("Available Books:")
for book in library.findAvailableBooks() {
    print("'\(book.title)' by \(book.author)")
}
print("Owner3 Books: \(owner3.borrowedBooks)")
print("\n\n")



/* -------------- TASK 2 _ Simulating E-commerce ------------- */
// Subtask 1: class Product
class Product {
    var productID: Int
    var name: String
    var price: Double
    
    // Designated initializer:
    init(productID: Int, name: String, price: Double) {
        self.productID = productID
        self.name = name
        self.price = price
    }
}

// Subtask 2: class Cart
class Cart {
    var cartID: Int
    var items: [Product]
    
    // Designated initializer:
    init(cartID: Int, items: [Product]) {
        self.cartID = cartID
        self.items = items
    }
    
    // Method for adding an item in a cart:
    func addItemInCart(item: Product) {
        items.append(item)
    }
    
    // Method for removing an item with it's ID:
    func removeItem(itemID: Int) {
        if let index = items.firstIndex(where: { $0.productID == itemID }) {
            items.remove(at: index)
        }
    }
    
    // Method for calculating product prices in a cart:
    func calculatePrice() -> Double {
        var total: Double = 0
        for item in items {
            total += item.price
        }
        return total
    }
}

// Subtask 3: class User
class User {
    var userID: Int
    var username: String
    var cart: Cart
    
    // Designated initializer:
    init(userID: Int, username: String, cart: Cart) {
        self.userID = userID
        self.username = username
        self.cart = cart
    }
    
    // Method for adding an item in a cart:
    func addItem(item: Product) {
        cart.addItemInCart(item: item)
    }
    
    // Method for removing an item in a cart:
    func removeItem(item: Product) {
        cart.removeItem(itemID: item.productID)
    }
    
    // Method for checkout:
    func checkout() {
        print("\(username) has to pay $\(cart.calculatePrice()).")
        for item in cart.items {
            cart.removeItem(itemID: item.productID)
        }
    }
}

// Subtask 4: Imitating E-commerce
print("E-commerce platform simulation")
print("-----------------------------------")

var mobilePhone = Product(productID: 1,
                          name: "iPhone 15",
                          price: 799)
var watch = Product(productID: 2,
                    name: "Wrist Watch",
                    price: 509.99)
var playstation5 = Product(productID: 3,
                           name: "Sony PlayStation 5",
                           price: 449.99)
var footwear = Product(productID: 4,
                       name: "Black Boot",
                       price: 69.99)

var anrisCart = Cart(cartID: 1,
                     items: [])
var georgesCart = Cart(cartID: 2,
                       items: [])
var anri = User(userID: 1,
                username: "aberidze",
                cart: anrisCart)
var george = User(userID: 2,
                  username: "george",
                  cart: georgesCart)

anri.addItem(item: mobilePhone)
anri.addItem(item: playstation5)
george.addItem(item: mobilePhone)
george.addItem(item: watch)
george.addItem(item: footwear)

print("Anri's cart item prices:")
for item in anrisCart.items {
    print(" - $\(item.price)")
}
print("\n")
print("George's cart item prices:")
for item in georgesCart.items {
    print(" - $\(item.price)")
}
print("\n")

print("Anri's checkout:")
anri.checkout()
print("\n")
print("George's checkout:")
george.checkout()
