//
//  CartGateway.swift
//  ASAP
//
//  Created by Giordano Scalzo on 24/12/2015.
//  Copyright © 2015 Giordano Scalzo. All rights reserved.
//

import Foundation

protocol CartGateway {
    func addProductID(productID: String)
    func removeProductID(productID: String)
    func buy()
}