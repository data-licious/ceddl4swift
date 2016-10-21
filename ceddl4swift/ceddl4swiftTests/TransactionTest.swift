//
//  TransactionTest.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 23/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import XCTest
@testable import ceddl4swift

class TransactionTest: XCTestCase {

    func testTransaction() {

        let digitalDataTransaction = DigitalData.create()
            .transaction()
            .transactionID("order1234")
            .profile()
            .profileInfo()
            .profileID("humanbeing12345")
            .userName("me")
            .email("test@example.com")
            .endProfileInfo()
            .address()
            .line1("673 My Street")
            .line2("Apt 1")
            .city("Austin")
            .stateProvince("TX")
            .postalCode("78610")
            .country("78610")
            .endAddress()
            .shippingAddress()
            .line1("674 My Street")
            .line2("Apt 2")
            .city("Austin")
            .stateProvince("TX")
            .postalCode("78610")
            .country("78610")
            .endAddress()
            .endProfile()
            .total()
            .basePrice(200)
            .voucherCode("Alpha")
            .voucherDiscount(0.50)
            .currency("EUR")
            .taxRate(0.20)
            .shipping(5)
            .shippingMethod("UPS")
            .priceWithTax(120)
            .transactionTotal(125)
            .endPrice()
            .addAttribute("testattribute", value: "example" as AnyObject)
            .attributes()
            .attribute("testattribute2", value: "example2" as AnyObject)
            .endAttributes()
            .addItem().productInfo()
            .productID("testproduct")
            .endProductInfo()
            .addPrimaryCategory("primary cat")
            .addCategory("other category", value: "other cat" as AnyObject)
            .quantity(10)
            .price()
            .basePrice(10)
            .endPrice()
            .addLinkedProduct()
            .productInfo()
            .productID("linkedproduct1")
            .endProductInfo()
            .endLinkedProduct()
            .addAttribuut("custom attribute", value: "value" as AnyObject)
            .endItem()
            .endTransaction()

        do {
            let digitalDataDictionary = digitalDataTransaction.getMap()
            if let json = try Utility.loadJSONFromFile(type(of: self), name: "transactionTest") as? Dictionary<String, AnyObject> {
                assert(digitalDataDictionary == json, "Digital Data is not equal to contents of file")
            } else {
                assert(false, "Unable to generate dictionary from file")
            }
        } catch let error {
            print(error)
            assert(false, "Digital Data threw an error")
        }
    }
}

