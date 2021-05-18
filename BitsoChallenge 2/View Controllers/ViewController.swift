//
//  ViewController.swift
//  BitsoChallenge
//
//  Created by Hassan Baraka on 05/11/21.
//

import UIKit


class ViewController: UICollectionViewController {
    func didUpdateCollectionView(_ bookModel: BooksViewModel, message: [BookPrice?]) {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
                                }
    }
    
    
    //@IBOutlet var collectionView: UICollectionView!
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bookPrices.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bookCell", for: indexPath as IndexPath) as! bookViewCell
        //cell.Book = bookPrices.keys[1]
        //cell.configure(with: BooksViewModel)
        let cellData = bookPrices[indexPath.row]
        cell.configure(with: BooksViewModel(with: cellData))
        //print(booksNames[indexPath.row])
        //print(pricesArray[indexPath.row])
        print(cell as Any)
        //cell.Book.text = booksNames[indexPath.row]
        //cell.Price.text = pricesArray[indexPath.row]
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ToDetail", sender: self)
    }
    
    func configureDelegates(){
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    func configureSpacing(){
        
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumInteritemSpacing = 2
        layout.minimumLineSpacing = 2
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        collectionView.collectionViewLayout = layout
    }
    
    let reuseIdentifier = "bookCell"
    var booksArray = [String]()
    var booksNames = [String]()
    var pricesArray = [String]()
    //var bookPrices = [String:String]()
    var bookPrices = [BookPrice]()
    var viewmodel: BooksViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //let serialQueue = DispatchQueue.global().sync()
        configureDelegates()
        configureSpacing()
        
        fetchData()
    }
    
    func fetchData(){
        
        DispatchQueue.global().sync(flags: .barrier) {
            NetworkManager.shared.fetchBooks() {[weak self] (res) in
                guard let self = self else { return }
                
                switch res {
                case .failure(let error):
                    print(error)
                case .success(let books):
                    for book in books.payload {
                        self.booksArray.append((book?.book)!)
                    }
                    print(self.booksArray)
                    DispatchQueue.global().sync() {
                        NetworkManager.shared.fetchPrice() {[weak self] (res) in
                            guard let self = self else { return }
                            
                            switch res {
                            case .failure(let error):
                                print(error)
                            case .success(let books):
                                
                                for book in books.payload {
                                    //print(book?.last as Any)
                                    //print(book?.book as Any)
                                    
                                    self.bookPrices.append(book!)
                                }
                                print(self.bookPrices)
                                
                               
                                print(self as Any)
                                DispatchQueue.main.async {
                                   self.collectionView.reloadData()
                                }
                                
                            }
                        }
                    }
                }
            }
        }
    
    }
}

