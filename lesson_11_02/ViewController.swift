//
//  ViewController.swift
//  lesson_11_02
//
//  Created by robson on 11.02.23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var mySearchField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var listButton: UIButton!
    
    var filteredProducts: [Product] = []
    var allProducts: [Product] = []
    var favoriteProducts: [Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        generateProducts()
        registerCells()
        configDelegetas()
    }
    // Register Cellfrom XIB
    private func registerCells() {
        let firstXIB = UINib(nibName: "ProductCell", bundle: .main)
        myTableView.register(firstXIB, forCellReuseIdentifier: "ProductCell")

    }
    
    // Configure all delegates
    private func configDelegetas() {
        mySearchField.delegate = self
        myTableView.delegate = self
        myTableView.dataSource = self
    }
    
    // Configure UI style
    private func configUI() {
        
    }
    // Generate hardcoded product list
    private func generateProducts() {
        allProducts.append(Product(icon: "shawarma", title: "Shawarma", isFavorite: false))
        allProducts.append(Product(icon: "bbq", title: "BBQ", isFavorite: false))
        allProducts.append(Product(icon: "tan", title: "Tan", isFavorite: false))
        allProducts.append(Product(icon: "cola", title: "Cola", isFavorite: false))
        allProducts.append(Product(icon: "qabab", title: "Qabab", isFavorite: false))
        
        filteredProducts = allProducts
    }
    
    // Update list
    @IBAction func updateList(_ sender: UIButton) {
        switch sender.tag {
            
        case 0:
            filteredProducts = allProducts
        case 1:
            filteredProducts = favoriteProducts
        default:
            break
        }
        
        myTableView.reloadData()
    }
    
    @IBAction func searchAction(_ sender: UIButton) {
    }
}


extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        mySearchField.resignFirstResponder()
        return true
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredProducts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell") as? ProductCell
        
        cell?.setData(filteredProducts[indexPath.row], index: indexPath.row)
        cell?.delegate = self
        return cell!
    }
    
    
    
}

extension ViewController: ProductCellDelegate {
    
    func didSelectFavorite(selectedIndex: Int) {
//        for i in 0..<filteredProducts.count {
//            filteredProducts[i].isFavorite = false
//            if filteredProducts[i].
//        }
    }
}
