//
//  DigitalData.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 20/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import Foundation

/// CEDDL4J is a Java Library, with a fluent API, for creating a Data Layer
/// (JavaScript Object) that follows the Customer Experience Digital Data Layer
/// (CEDDL) specification.
/// The CEDDL specification "describes a
/// method for surfacing customer experience digital data on a web or other
/// digital resource as a JavaScript Object which can be used for communicating
/// this data to digital analytics and reporting servers."
/// The complete CEDDL specification can be found at <a
/// href="http://www.w3.org/2013/12/ceddl-201312.pdf"
/// >http://www.w3.org/2013/12/ceddl-201312.pdf</a>
/// Example Data Layer: (from the CEDDL specification)
///
///     digitalData = {
///          pageInstanceID: "MyHomePage-Production",
///		     page:{
///			    pageInfo:{
///				pageID: "Home Page",
///				destinationURL: "http://mysite.com/index.html"
///			 },
///			 category:{
///				primaryCategory: "FAQ Pages",
///				subCategory1: "ProductInfo",
///				pageType: "FAQ"
///			 },
///			 attributes:{
///				country: "US",
///				language: "en-US"
///			 }
///		  }
///
/// The CEDDL4J code to generate this Data Layer:
///
///        DigitalData ddb = DigitalData.create("MyHomePage-Production")
///		      .page()
///		      .pageInfo()
///		      .pageID("Home Page")
///		      .destinationURL("http://mysite.com/index.html")
///		      .endPageInfo()
///		      .addPrimaryCategory("FAQ Pages")
///		      .addCategory("subCategory1", "ProductInfo")
///		      .addCategory("pageType", "FAQ")
///		      .addAttribute("country", "US")
///		      .addAttribute("language", "en-US")
///		      .endPage();
///        }

public class DigitalData: NSObject, JSONProtocol {


    /// Constant for the version of CEDDL (1.0) implemented by this library.
    public static let VERSION_1_0: String = "1.0";


    /// Constant for the Default security category.
    public static let DEFAULT_SECURITY: String = "Default"


    /// Name of the Root JavaScript Object: digitalData
    public static let ROOT_JSO: String = "digitalData"


    //JSON id - pageInstanceID
    private var pageInstanceID: String!

    //JSON id - page
    private var ddPage: Page!

    //JSON id - product
    private var product: Array<Product>!

    //JSON id - cart
    private var ddCart: Cart!

    //JSON id - transaction
    private var ddTransaction: Transaction!

    //JSON id - event
    private var event: Array<Event>!

    //JSON id - component
    private var component: Array<Component>!

    //JSON id - user
    private var user: Array<User>!

    //JSON id - privacy
    private var ddPrivacy: Privacy!

    //JSON id - version
    private var ddVersion: String!


    ///Init a DigitalData object.
    public override init() {
        super.init()
    }


    /// Creates a new DigitalData object.
    /// - Returns: new DigitalData object
    public static func create() -> DigitalData {
        return DigitalData()
    }


    /// Creates a new DigitalData object and set the pageInstanceID.
    /// - Returns: new DigitalData object
    public static func create(_ pageInstanceID: String) -> DigitalData {
        return DigitalData().pageInstanceId(pageInstanceID)
    }


    /// Sets the Page Identifier Object.
    /// - Parameter pageInstanceID: A unique identifier for a page or 
    /// other piece of content for which data is being collected. 
    /// This value SHOULD distinguish among environments, 
    /// such as whether this page is in development, staging, or production.
    /// - Returns: The current DigitalData object
    public func pageInstanceId(_ pId: String) -> DigitalData {
        pageInstanceID = pId
        return self
    }


    /// Provides access to the Page object.
    ///
    /// The Page object carries significant details about the page, and the most
    ///commonly used data elements are captured by the specification below.
    ///
    /// - Returns: The ComponentInfo object for this Component
    public func page() -> Page {
        if ddPage == nil {
            ddPage = Page(parent: self)
        }
        return ddPage
    }


    /// Sets the Page object.
    ///
    /// The Page object carries significant details about the page, and the most
    /// commonly used data elements are captured by the specification below.
    ///
    /// - Parameter page: The Page Object to set.
    /// - Returns: The current DigitalData object
    public func setPage(_ page: Page) -> DigitalData {
        ddPage = page
        return self
    }


    /// Adds a new Product to the list of products.
    ///
    /// The Product object carries details about a particular product with
    /// frequently used properties listed below. This is intended for data about
    /// products displayed on pages or other content. For products added to a
    /// shopping cart or ordered in a transaction, see the Cart and Transaction
    /// objects below.
    ///
    /// - Returns: a new Product object
    public func addProduct() -> Product {
        if product == nil {
            product = Array<Product>()
        }
        let newProduct = Product(parent: self)
        product.append(newProduct)
        return newProduct
    }


    /// Adds a provided Product to the list of products.
    ///
    /// The Product object carries details about a particular product with
    /// frequently used properties listed below. This is intended for data about
    /// products displayed on pages or other content. For products added to a
    /// shopping cart or ordered in a transaction, see the Cart and Transaction
    /// objects below.
    ///
    /// - Parameter newProduct: The Product Object to add to the list of products.
    /// - Returns: current Digital Data Object
    public func addProduct(_ newProduct: Product) -> DigitalData {
        if product == nil {
            product = Array<Product>()
        }
        product.append(newProduct)
        return self
    }


    /// Provides access to the Cart object.
    ///
    /// The Cart object carries details about a shopping cart or basket and the
    /// products that have been added to it. The Cart object is intended for a
    /// purchase that has not yet been completed. See the Transaction object
    /// below for completed orders.
    ///
    /// - Returns: Cart object
    public func cart() -> Cart {
        if ddCart == nil {
            ddCart = Cart(parent: self)
        }
        return ddCart
    }


    /// Sets the Cart object.
    ///
    /// The Cart object carries details about a shopping cart or basket and the
    /// products that have been added to it. The Cart object is intended for a
    /// purchase that has not yet been completed. See the Transaction object
    /// below for completed orders.
    ///
    /// - Parameter cart: The Cart Object to set.
    /// - Returns: current Digital Data Object
    public func setCart(_ cart: Cart) -> DigitalData {
        ddCart = cart;
        return self
    }


    /// Provides access to the Transaction object.
    ///
    /// The Transaction object is similar to the Cart object, but represents a
    /// completed order. The Transaction object contains analogous sub-objects to
    /// the Cart object as well as additional subobjects specific to completed
    /// orders.
    ///
    /// - Returns: Transaction Object
    public func transaction() -> Transaction {
        if ddTransaction == nil {
            ddTransaction = Transaction(parent: self)
        }
        return ddTransaction;
    }


    /// Sets the Transaction object
    ///
    /// The Transaction object is similar to the Cart object, but represents a
    /// completed order. The Transaction object contains analogous sub-objects to
    /// the Cart object as well as additional subobjects specific to completed
    /// orders.
    ///
    /// - Parameter transaction: The Transaction Object to set.
    /// - Returns: current Digital Data Object
    public func setTransaction(_ transaction: Transaction) -> DigitalData {
        ddTransaction = transaction;
        return self
    }


    /// Adds a new Event to the list of events that were measured.
    ///
    /// The Event object collects information about an interaction event by the
    /// user. An event might be a button click, the addition of a portal widget,
    /// playing a video, adding a product to the shopping cart, etc. Any action
    /// on the page could be captured by an Event object.
    ///
    /// - Returns a new Event object
    public func addEvent() -> Event {
        if event == nil {
            event = Array<Event>()
        }
        let newEvent = Event(parent: self)
        event.append(newEvent)
        return newEvent
    }


    /// Adds a provided Event to the list of events that were measured.
    ///
    /// The Event object collects information about an interaction event by the
    /// user. An event might be a button click, the addition of a portal widget,
    /// playing a video, adding a product to the shopping cart, etc. Any action
    /// on the page could be captured by an Event object.
    ///
    /// - Parameter newEvent: The Event Object to add to the list of events.
    /// - Returns: current Digital Data Object
    public func addEvent(_ newEvent: Event) -> DigitalData {
        if event == nil {
            event = Array<Event>()
        }
        event.append(newEvent)
        return self
    }


    /// Adds a new Component to the list of page components.
    ///
    /// The Component object is intended to capture information about a content
    /// component included as part of a page, such as a video. Interactions with
    /// the component  - such as playing the video - would be an Event, captured
    /// by the Event object above.
    ///
    /// - Returns: a new Component object
    public func addComponent() -> Component {
        if component == nil {
            component = Array<Component>()
        }
        let newComponent = Component(parent: self)
        component.append(newComponent)
        return newComponent
    }


    /// Adds a provided Component to the list of page components.
    ///
    /// The Component object is intended to capture information about a content
    /// component included as part of a page, such as a video. Interactions with
    /// the component - such as playing the video - would be an Event, captured
    /// by the Event object above.
    ///
    /// - Parameter newComponent: The Component Object to add to the list of page components.
    /// - Returns: current Digital Data Object
    public func addComponent(_ newComponent: Component) -> DigitalData {
        if component == nil {
            component = Array<Component>()
        }
        component.append(newComponent)
        return self
    }


    /// Adds a new user to the list of list of users interacting with the page.
    ///
    /// The User object captures the profile of a user who is interacting with
    /// the website.
    ///
    /// (Although typically web data has a single user per recorded interaction,
    /// this object is an array and can capture multiple users.)
    ///
    /// - Returns: a new User object
    public func addUser() -> User {
        if user == nil {
            user = Array<User>()
        }
        let newUser = User(parent: self)
        user.append(newUser)
        return newUser
    }


    /// Adds a provided object user to the list of list of users interacting with
    /// the page.
    ///
    /// The User object captures the profile of a user who is interacting with
    /// the website.
    ///
    /// (Although typically web data has a single user per recorded interaction,
    /// this object is an array and can capture multiple users.)
    ///
    /// - Parameter newUser: The User Object to add to the list of users.
    /// - Returns: current Digital Data Object
    public func addUser(_ newUser: User) -> DigitalData {
        if user == nil {
            user = Array<User>()
        }
        user.append(newUser)
        return self
    }


    /// Provides access to the Privacy object.
    /// - Returns: Privacy Object
    public func privacy() -> Privacy {
        if ddPrivacy == nil {
            ddPrivacy = Privacy(parent: self)
        }
        return ddPrivacy
    }


    /// Sets the Privacy object.
    ///
    /// - Parameter privacy: The Privacy Object to set.
    /// - Returns: current Digital Data Object
    public func setPrivacy(_ privacy: Privacy) -> DigitalData {
        ddPrivacy = privacy
        return self
    }


    /// Sets the version of the CEDDL specification used by the digitalData object
    /// to a custom value.
    ///
    /// - Parameter version: Custom version value
    /// - Returns: The current DigitalData object
    public func version(_ version: String) -> DigitalData {
        ddVersion = version
        return self
    }

    /// Sets the version of the CEDDL specification used by the digitalData object
    /// to "1.0".
    ///
    /// - Returns: The current DigitalData object
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


    /// Returns the DigitalData Object as a JSON String not including.
    ///
    ///     {digitalData =}
    ///
    /// - Returns: String containing DigitalData in JSON format, not starting with {@code digitalData =}
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


    /// Returns the DigitalData Object as a JSON String including 
    ///
    ///     {digitalData =}.
    ///
    /// @return String containing DigitalData in JSON format, starting with {digitalData =}
    public func toStringWithRootObject() throws -> String {
        return try DigitalData.ROOT_JSO + "=" + toString()
    }
}
