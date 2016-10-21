//
//  DigitalData.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 20/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import Foundation

public class DigitalData: NSObject {

    public static let VERSION_1_0: String = "1.0";
    public static let DEFAULT_SECURITY: String = "Default"
    public static let ROOT_JSO: String = "digitalData"

    fileprivate var pageInstanceID: String!
    fileprivate var ddPage: Page!
    fileprivate var product: Array<Product>!
    fileprivate var ddCart: Cart!
    fileprivate var ddTransaction: Transaction!
    fileprivate var event: Array<Event>!
    fileprivate var component: Array<Component>!
    fileprivate var user: Array<User>!
    fileprivate var ddPrivacy: Privacy!
    fileprivate var ddVersion: String!

    public static func create() -> DigitalData {
        return DigitalData()
    }

    public static func create(pageInstanceID: String) -> DigitalData {
        return DigitalData().pageInstanceId(pageInstanceID: pageInstanceID)
    }

    public func pageInstanceId(pageInstanceID pId: String) -> DigitalData {
        pageInstanceID = pId
        return self
    }

    public func page() -> Page {
        if ddPage == nil {
            ddPage = Page(parent: self)
        }
        return ddPage
    }

    public func setPage(page: Page) -> DigitalData {
        ddPage = page
        return self
    }

    public func addProduct() -> Product {
        if product == nil {
            product = Array<Product>()
        }
        let newProduct = Product(parent: self)
        product.append(newProduct)
        return newProduct
    }

    public func addProduct(newProduct: Product) -> DigitalData {
        if product == nil {
            product = Array<Product>()
        }
        product.append(newProduct)
        return self
    }

    public func cart() -> Cart {
        if ddCart == nil {
            ddCart = Cart(parent: self)
        }
        return ddCart
    }

    public func setCart(cart: Cart) -> DigitalData {
        ddCart = cart;
        return self
    }

    public func transaction() -> Transaction {
        if ddTransaction == nil {
            ddTransaction = Transaction(parent: self)
        }
        return ddTransaction;
    }

    public func setTransaction(transaction: Transaction) -> DigitalData {
        ddTransaction = transaction;
        return self
    }

    public func addEvent() -> Event {
        if event == nil {
            event = Array<Event>()
        }
        let newEvent = Event(parent: self)
        event.append(newEvent)
        return newEvent
    }

    public func addEvent(newEvent: Event) -> DigitalData {
        if event == nil {
            event = Array<Event>()
        }
        event.append(newEvent)
        return self
    }

    public func addComponent() -> Component {
        if component == nil {
            component = Array<Component>()
        }
        let newComponent = Component(parent: self)
        component.append(newComponent)
        return newComponent
    }

    public func addComponent(newComponent: Component) -> DigitalData {
        if component == nil {
            component = Array<Component>()
        }
        component.append(newComponent)
        return self
    }

    public func addUser() -> User {
        if user == nil {
            user = Array<User>()
        }
        let newUser = User(parent: self)
        user.append(newUser)
        return newUser
    }

    public func addUser(newUser: User) -> DigitalData {
        if user == nil {
            user = Array<User>()
        }
        user.append(newUser)
        return self
    }

    public func privacy() -> Privacy {
        if ddPrivacy == nil {
            ddPrivacy = Privacy(parent: self)
        }
        return ddPrivacy
    }

    public func setPrivacy(privacy: Privacy) -> DigitalData {
        ddPrivacy = privacy
        return self
    }
    
    public func version(version v: String) -> DigitalData {
        ddVersion = v
        return self
    }
    
    public func version() -> DigitalData {
        ddVersion = DigitalData.VERSION_1_0
        return self
    }
    
    public func toString() throws -> String {
        return ""
    }
    
    public func toStringWithRootObject() throws -> String {
        return ""
    }
}
