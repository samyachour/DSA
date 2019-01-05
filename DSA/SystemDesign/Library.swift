/*
 We will focus on the following set of requirements while designing the Library Management System:
 
 Any library member should be able to search books by their title, author, subject category as well by the publication date.
 
 Each book will have a unique identification number and other details including a rack number which will help to locate the book.
 
 There could be more than one copy of a book, and library members should be able to check-out and reserve any copy. We will call each copy of a book, a book item.
 
 The system should be able to retrieve information like who took a particular book or what are the books checked-out by a specific library member.
 
 There should be a maximum limit on how many books a member can check-out.
 
 The system should be able to collect fines for books returned after the due date.
 
 Members should be able to reserve books that are not currently available.
 
 The system should be able to send notifications whenever the reserved books become available, as well as when the book is not returned within the due date.
 
 The system will be able to read barcodes from books and members’ library cards.
 */

import Foundation

let MAX_BOOKS_ISSUED_TO_A_USER = 5
let MAX_LENDING_DAYS = 10

enum BookFormat {
    case Hardcover
    case Paperback
    case Audiobook
    case Ebook
    case Newspaper
    case Magazine
    case Journal
}

enum BookStatus {
    case Available
    case Reserved
    case Loaned
    case Lost
}

enum ReservationStatus {
    case Waiting
    case Pending
    case Completed
    case Canceled
    case None
}

enum AccountStatus {
    case Active
    case Closed
    case Canceled
    case Blacklisted
    case None
}

struct Address {
    let streetAddress: String
    let city: String
    let state: String
    let zipcode: String
    let country: String
    
    init(streetAddress: String, city: String, state: String, zipcode: String, country: String) {
        self.streetAddress = streetAddress
        self.city = city
        self.state = state
        self.zipcode = zipcode
        self.country = country
    }
}

struct Person {
    let name: String
    let address: Address
    let email: String
    let phone: String
    
    init(name: String, address: Address, email: String, phone: String) {
        self.name = name
        self.address = address
        self.email = email
        self.phone = phone
    }
}

struct Author {
    let name: String
    let description: String
    
    init(name: String, description: String) {
        self.name = name
        self.description = description
    }
    
}

struct Library {
    let name: String
    let address: Address
    
    init(name: String, address: Address) {
        self.name = name
        self.address = address
    }
}

struct Rack {
    let number: Int
    let locationIdentifier: String
    
    init(number: Int, locationIdentifier: String) {
        self.number = number
        self.locationIdentifier = locationIdentifier
    }
}

class Book {
    let ISBN: String
    let title: String
    let subject: String
    let publisher: String
    let language: String
    let numberOfPages: Int
    
    init(ISBN: String, title: String, subject: String, publisher: String, language: String, numberOfPages: Int) {
        self.ISBN = ISBN
        self.title = title
        self.subject = subject
        self.publisher = publisher
        self.language = language
        self.numberOfPages = numberOfPages
    }
}

class BookItem: Book {
    let barcode: String
    var isReferenceOnly: Bool
    var borrowed: Date?
    var dueDate: Date?
    var price: Double
    let format: BookFormat
    var status: BookStatus
    let dateOfPurchase: Date
    let publicationDate: Date
    
    init(barcode: String, isReferenceOnly: Bool, price: Double, format: BookFormat, status: BookStatus, dateOfPurchase: Date, publicationDate: Date, ISBN: String, title: String, subject: String, publisher: String, language: String, numberOfPages: Int) {
        self.barcode = ISBN
        self.isReferenceOnly = isReferenceOnly
        self.price = price
        self.format = format
        self.status = status
        self.dateOfPurchase = dateOfPurchase
        self.publicationDate = publicationDate
        super.init(ISBN: ISBN, title: title, subject: subject, publisher: publisher, language: language, numberOfPages: numberOfPages)
    }
    
    func checkout(memberID: String) -> Bool {
        if self.isReferenceOnly {
            print("This book is reference only and can't be issued")
        }
        return false
    }
}
