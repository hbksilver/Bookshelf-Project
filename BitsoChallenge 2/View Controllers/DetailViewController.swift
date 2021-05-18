//
//  DetailViewController.swift
//  BitsoChallenge
//
//  Created by hassan Baraka on 5/11/21.
//
//
//  DetailViewController.swift
//  BottleRocketAssignement
//
//  Created by Hassan baraka on 05/10/21.
//

import UIKit
class DetailViewController: UIViewController {
   
    @IBOutlet weak var bidLabel: UILabel!
    @IBOutlet weak var askLabel: UILabel!
    @IBOutlet weak var lowLabel: UILabel!
    @IBOutlet weak var highLabel: UILabel!
    @IBOutlet weak var _24_hour_volumeLabel: UILabel!
    @IBOutlet weak var spreadLevel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(BookPrice.self as Any)
        
      /* bidLabel.text = BookPrice?.bid
        askLabel.text = BookPrice?.ask
        lowLabel.text = BookPrice?.low
        highLabel.text = BookPrice?.high
        _24_hour_volumeLabel.text = BookPrice?.volume*/
        
       
        }
       
    }


