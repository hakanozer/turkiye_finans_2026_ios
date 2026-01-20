//
//  ProductDetailViewController.swift
//  turkiye_finans_2026_ios
//
//  Created by HAKAN ÖZER on 20.01.2026.
//

import UIKit
import CoreApp
import DomainApp

class ProductDetailViewController: UIViewController {
    
    weak var delegate: ProductSelectionDelegate?
    var product: Product?

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func fncPriceChange(_ sender: UIButton) {
        if product != nil {
            //print(product!.name)
            let proModel = ProductModel(id: UUID(), name: product!.name, price: 10)
            self.delegate?.didSelectProduct(product: proModel)
        }
    }
    


}
