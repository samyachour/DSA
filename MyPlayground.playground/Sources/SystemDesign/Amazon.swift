/*
 
We will be designing a system with the following requirements:
 Users should be able to add new products for selling.
 Users should be able to search products by their name or category.
 Users can search and view all the products but to buy a product, they will have to become a registered member.
 Users should be able to add/remove/modify product items in their shopping cart.
 Users can check-out to buy items in the shopping cart.
 Users can rate a product and add a review of a product.
 The user should be able to specify a shipping address where their order will be delivered.
 User can cancel an order if it has not been shipped.
 Users should get notifications whenever there is a change in the order or shipping status.
 Users of our system should be able to pay through credit cards or electronic bank transfer.
 Users should be able to track their shipment in order to see the current state of their order.
 
 NOTE: Declaring all variables in classes & structs with an empty value to avoid having to write init functions which would take extra time
 NOTE: Unfinished
 */

struct Address {
    var streetAddress = ""
    var city = ""
    var state = ""
    var zipcode = ""
    var country = ""
}

enum OrderStatus {
    case UNSHIPPED
    case PENDING
    case SHIPPED
    case COMPLETED
    case CANCELED
    case REFUND_APPLIED
}

