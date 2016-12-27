//
//  DigitalDataTest.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 23/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import XCTest
@testable import ceddl4swift

class DigitalDataTest: XCTestCase {

    func testSetters() {
        let digitalData = DigitalData.create("pageInstanceID")

        let page = Page()
        _ = page.pageInfo().pageID("pageID")
        _ = digitalData.setPage(page)

        let product = Product()
        _ = product.productInfo().productID("productID")
        _ = digitalData.addProduct(product)

        let cart = Cart()
        _ = cart.cartID("cartID")
        _ = digitalData.setCart(cart)

        let transaction = Transaction()
        _ = transaction.transactionID("transactionID")
        _ = digitalData.setTransaction(transaction)

        let event = Event()
        _ = event.eventInfo().eventName("ëventName")
        _ = digitalData.addEvent(event)

        let user = User()
        _ = digitalData.addUser(user)
        
        let component = Component()
        _ = component.componentInfo().componentID("componentID")
        _ = digitalData.addComponent(component)

        let privacy = Privacy()
        _ = privacy.addDefaultAccessCategory().domains(["www.example.com"])
        _ = digitalData.setPrivacy(privacy)

        _ = digitalData.version("1.0")

        do {
            let digitalDataDictionary = digitalData.getMap()
            if let json = try Utility.loadJSONFromFile(self.dynamicType, name: "settersTest") as? Dictionary<String, AnyObject> {
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
