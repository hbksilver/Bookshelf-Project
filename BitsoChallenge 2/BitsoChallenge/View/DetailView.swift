//
//  DetailView.swift
//  BitsoChallenge
//
//  Created by hassan Baraka on 5/12/21.
//

import UIKit

class DetailCollectionView: UICollectionViewCell {
    
    @IBOutlet weak var bidLabel: UILabel!
    @IBOutlet weak var lowLabel: UILabel!
    @IBOutlet weak  var askLabel: UILabel!
    @IBOutlet weak var highLabel: UILabel!
    @IBOutlet weak var volumeLabel: UILabel!
    @IBOutlet weak  var _24_hour_volumeLabel: UILabel!
    static let reuseId = String(describing: DetailCollectionView.self)
    var viewModel:DetailViewModel?
    
    func configure(with viewModel:DetailViewModel){
        let urlString = viewModel.messages
        print(urlString)
        
        //let url = URL(BookPrice: message)
       // print(url as Any)
        DispatchQueue.global().async {
            //let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
            DispatchQueue.main.async { [self] in
               
               
            }
        }
        
       
        self.viewModel = viewModel
        self.bidLabel.text = viewModel.bid
        self.askLabel.text = viewModel.ask
        self.lowLabel.text = viewModel.low
        self.highLabel.text = viewModel.high
        self._24_hour_volumeLabel.text = viewModel.volume
        
    }
    
    
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}

