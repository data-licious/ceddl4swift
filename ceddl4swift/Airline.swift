//
//  Airline.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 23/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import Foundation

public class Airline: NSObject {

    public func airlineExample() {

        let calendar = Calendar(identifier: .gregorian)

        var departureDateComponent = DateComponents()
        departureDateComponent.year = 2013
        departureDateComponent.month = 11
        departureDateComponent.day = 15
        departureDateComponent.hour = 14
        departureDateComponent.minute = 20
        departureDateComponent.second = 0
        let departureDate = calendar.date(from: departureDateComponent)

        var arrivalDateComponent = DateComponents()
        arrivalDateComponent.year = 2013
        arrivalDateComponent.month = 11
        arrivalDateComponent.day = 16
        arrivalDateComponent.hour = 21
        arrivalDateComponent.minute = 40
        arrivalDateComponent.second = 0
        let arrivalDate = calendar.date(from: arrivalDateComponent)

        let product = ((((((((((Product().productInfo()
            .productID("734565538989889110")
            .description("Business Class One-Way Ticket")
            .custom("originAirportCode", value: "RDU" as AnyObject) as! ProductInfo<Product>)
            .custom("originCity", value: "Raleigh" as AnyObject) as! ProductInfo<Product>)
            .custom("originState", value: "North Carolina" as AnyObject) as! ProductInfo<Product>)
            .custom("originCounty", value: "USA" as AnyObject) as! ProductInfo<Product>)
            .custom("destinationAirportCode", value: "BOM" as AnyObject) as! ProductInfo<Product>)
            .custom("destinationState", value: "Maharashtra" as AnyObject) as! ProductInfo<Product>)
            .custom("destinationCountry", value: "India" as AnyObject) as! ProductInfo<Product>)
            .custom("departureDate", value: departureDate as AnyObject) as! ProductInfo<Product>)
            .custom("arrivalDate", value: arrivalDate as AnyObject) as! ProductInfo<Product>)
            .custom("numberOfTravellers", value: 1 as AnyObject) as! ProductInfo<Product>)
            .endProductInfo()

        let cart = (Cart().price()
            .basePrice(1000.00)
            .currency("USD")
            .custom("fees", value: 200 as AnyObject) as! Price<Cart>)
            .taxRate(0.08)
            .cartTotal(1296.00)
            .endPrice()

        let user = User().addSegment("frequentFlyerClub", value: "Silver Elite")

        let airlineDigitalData = DigitalData.create()
            .addProduct(product)
            .setCart(cart)
            .addUser(user)
        
        do {
            let airlineDigitalDataDict = airlineDigitalData.getMap()
            if let json = try TestUtililty.loadJSONFromFile(type(of: self), name: "airline-example") as? Dictionary<String, AnyObject> {
                assert(airlineDigitalDataDict == json, "Digital Data is not equal to contents of file")
            } else {
                assert(false, "Unable to generate dictionary from file")
            }
        } catch let error {
            print(error)
        }
    }
}
