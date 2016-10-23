//
//  DigitalData.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 20/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import Foundation

public class DigitalData: NSObject, JSONProtocol {

    public static let VERSION_1_0: String = "1.0";
    public static let DEFAULT_SECURITY: String = "Default"
    public static let ROOT_JSO: String = "digitalData"


    // MARK : JSON - pageInstanceID
    private var pageInstanceID: String!

    // MARK : JSON - page
    private var ddPage: Page!

    // MARK : JSON - product
    private var product: Array<Product>!

    // MARK : JSON - cart
    private var ddCart: Cart!

    // MARK : JSON - transaction
    private var ddTransaction: Transaction!

    // MARK : JSON - event
    private var event: Array<Event>!

    // MARK : JSON - component
    private var component: Array<Component>!

    // MARK : JSON - user
    private var user: Array<User>!

    // MARK : JSON - privacy
    private var ddPrivacy: Privacy!

    // MARK : JSON - version
    private var ddVersion: String!

    public static func create() -> DigitalData {
        return DigitalData()
    }

    public static func create(_ pageInstanceID: String) -> DigitalData {
        return DigitalData().pageInstanceId(pageInstanceID)
    }

    public func pageInstanceId(_ pId: String) -> DigitalData {
        pageInstanceID = pId
        return self
    }

    public func page() -> Page {
        if ddPage == nil {
            ddPage = Page(parent: self)
        }
        return ddPage
    }

    public func setPage(_ page: Page) -> DigitalData {
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

    public func addProduct(_ newProduct: Product) -> DigitalData {
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

    public func setCart(_ cart: Cart) -> DigitalData {
        ddCart = cart;
        return self
    }

    public func transaction() -> Transaction {
        if ddTransaction == nil {
            ddTransaction = Transaction(parent: self)
        }
        return ddTransaction;
    }

    public func setTransaction(_ transaction: Transaction) -> DigitalData {
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

    public func addEvent(_ newEvent: Event) -> DigitalData {
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

    public func addComponent(_ newComponent: Component) -> DigitalData {
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

    public func addUser(_ newUser: User) -> DigitalData {
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

    public func setPrivacy(_ privacy: Privacy) -> DigitalData {
        ddPrivacy = privacy
        return self
    }
    
    public func version(_ version: String) -> DigitalData {
        ddVersion = version
        return self
    }
    
    public func version() -> DigitalData {
        ddVersion = DigitalData.VERSION_1_0
        return self
    }

    func getMap() -> Dictionary<String, AnyObject> {
        var dictionary = Dictionary<String, AnyObject>()
        if pageInstanceID != nil {
            dictionary["pageInstanceID"] = pageInstanceID as AnyObject
        }
        if ddPage != nil {
            dictionary["page"] = ddPage.getMap() as AnyObject
        }
        if product != nil {
            var productDictionary = Array<Dictionary<String, AnyObject>>()
            for prod in product {
                productDictionary.append(prod.getMap())
            }
            dictionary["product"] = productDictionary as AnyObject
        }
        if ddCart != nil {
            dictionary["cart"] = ddCart.getMap() as AnyObject
        }
        if ddTransaction != nil {
            dictionary["transaction"] = ddTransaction.getMap() as AnyObject
        }
        if event != nil {
            var eventDictionary = Array<Dictionary<String, AnyObject>>()
            for eve in event {
                eventDictionary.append(eve.getMap())
            }
            dictionary["event"] = eventDictionary as AnyObject
        }
        if component != nil {
            var componentDictionary = Array<Dictionary<String, AnyObject>>()
            for comp in component {
                componentDictionary.append(comp.getMap())
            }
            dictionary["component"] = componentDictionary as AnyObject
        }
        if user != nil {
            var userDictionary = Array<Dictionary<String, AnyObject>>()
            for usr in user {
                userDictionary.append(usr.getMap())
            }
            dictionary["user"] = userDictionary as AnyObject
        }
        if ddPrivacy != nil {
            dictionary["privacy"] = ddPrivacy.getMap() as AnyObject
        }
        if ddVersion != nil {
            dictionary["version"] = ddVersion as AnyObject
        }
        return dictionary
    }
    
    public func toString() throws -> String {
        var digitalData = ""
        let map = getMap()
        let json = try JSONSerialization.data(withJSONObject: map, options: .prettyPrinted)
        if let jsonString = String(data: json, encoding: .utf8) {
            digitalData = jsonString
        } else {
            throw DigitalDataError.parsingFailed("Unable to parse the created object")
        }
        return digitalData
    }
    
    public func toStringWithRootObject() throws -> String {
        return ""
    }
}
