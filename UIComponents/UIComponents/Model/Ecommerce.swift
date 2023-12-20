import Foundation

struct ItemDetails {
    var name: String
    var price: String
    var description: String
    var isSelect = false
}

struct Ecommerce {
    var category: String
    var itemName: [ItemDetails]
    
    static func getItemList() -> [Ecommerce] {
        return [Ecommerce(category: "Elctronics",
                          itemName: [ItemDetails(name: "Mobile", price: "20000", description: "realme 9 5g"),
                                     ItemDetails(name: "tv", price: "40000", description: "oneplus")]),
                Ecommerce(category: "Clothes",
                          itemName: [ItemDetails(name: "T-shirt", price: "500", description: "Half sleeve T-shirt"),
                                     ItemDetails(name: "shirt", price: "600", description: "Full sleeve Shirt")])]
    }
}
