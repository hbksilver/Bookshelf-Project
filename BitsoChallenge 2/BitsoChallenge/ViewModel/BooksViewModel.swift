//
//  BooksViewModel.swift
//  BitsoChallenge
//
//  Created by Hassan Baraka on 05/10/21.
//

import Foundation

protocol didUpdate{
    
    func didUpdateCollectionView(_ bookModel: BooksViewModel, message: [BookPrice?])
}
class BooksViewModel {
    
    //var delegate: didUpdate?
    var messages = [Book]()
    
    var name: String?
    var price: String?
    
    let reuseIdentifier = "bookCell"
    var booksArray = [String]()
    var booksNames = [String]()
    var pricesArray = [String]()
    var bookPrices = [String:String]()
    
    init(with model:BookPrice){
        name = model.book
        price = format(price: model.last!)
        
        
        
    }
    
        
        func format(price: String) -> String {
            
            let double = Double(price)
            let price = String(format: "$%.02f", double!)
            return price
        }

}
