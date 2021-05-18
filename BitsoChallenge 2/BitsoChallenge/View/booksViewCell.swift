//
//  booksViewmodel.swift
//  BitsoChallenge
//
//  Created by Hassan Baraka on 5/7/21.
//

import Foundation
import UIKit

class bookViewCell: UICollectionViewCell{
    @IBOutlet weak var book: UILabel!
    @IBOutlet weak var price: UILabel!
    
    
    var viewModel:BooksViewModel?
    
    func configure(with viewModel:BooksViewModel){
        
        self.viewModel = viewModel
        book.text = viewModel.name
        price.text = viewModel.price
    }
    
}
