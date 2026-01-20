//
//  ProductSelectionDelegate.swift
//  CoreApp
//
//  Created by HAKAN ÖZER on 20.01.2026.
//
import DomainApp

public protocol ProductSelectionDelegate: AnyObject {
    // Fonksiyonun gövdesi olmaz, sadece imzası olur.
    func didSelectProduct(product: ProductModel)
}
