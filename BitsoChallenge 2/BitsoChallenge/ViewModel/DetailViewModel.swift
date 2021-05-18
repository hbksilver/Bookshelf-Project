//
//  DetailViewModel.swift
//  BitsoChallenge
//
//  Created by hassan Baraka on 5/11/21.
//

import Foundation

protocol detaildidUpdate{
    
    func didUpdateCollectionView(_ bookModel: DetailViewModel, message: [BookPrice?])
}
class DetailViewModel {
    
    //var delegate: didUpdate?
    var messages = [Book]()
    
    var bid: String?
    var ask: String?
    var low: String?
    var high: String?
    var volume: String?
  
    
    init(with model:BookPrice){
        bid = model.book
        ask = model.book
        low = model.book
        high = model.book
        volume = model.book
        
        
        
        
        
    }
    
        
        func format(price: String) -> String {
            
            let double = Double(price)
            let price = String(format: "$%.02f", double!)
            return price
        }

}
