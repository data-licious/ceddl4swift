//
//  ProductInfo.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 20/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import Foundation

open class ProductInfo<T>: BaseItem<AnyObject> {

    private let PRODUCT_ID = "productID"
    private let PRODUCT_NAME = "productName"
    private let DESCRIPTION = "description"
    private let PRODUCT_URL = "productURL"
    private let PRODUCT_IMAGE = "productImage"
    private let PRODUCT_THUMBNAIL = "productThumbnail"
    private let MANUFACTURER = "manufacturer"
    private let SKU = "sku"
    private let COLOR = "color"
    private let SIZE = "size"

    private var parent: T


    /// init an ProductInfo object.
    /// - Parameter parent: The parent Object
    public init(parent p: T) {
        parent = p
    }


    /// Returns to the parent object.
    /// - Returns: parent object
    open func endProductInfo() -> T {
        return parent
    }


    /// Sets the productID.
    /// - Parameter productID: String
    /// - Returns: current Object
    open func productID(_ productID: String) -> Self {
        addItem(PRODUCT_ID, value: productID as AnyObject)
        return self
    }


    /// Sets the productName.
    /// - Parameter productName: String
    /// - Returns: current Object
    open func productName(_ productName: String) -> Self {
        addItem(PRODUCT_NAME, value: productName as AnyObject)
        return self
    }


    /// Sets the description.
    /// - Parameter description: String
    /// - Returns: current Object
    open func description(_ description: String) -> Self {
        addItem(DESCRIPTION, value: description as AnyObject)
        return self
    }


    /// Sets the productURL.
    /// - Parameter productURL: String
    /// - Returns: current Object
    open func productURL(_ productURL: String) -> Self {
        addItem(PRODUCT_URL, value: productURL as AnyObject)
        return self
    }


    /// Sets the productImage.
    /// - Parameter productImage: String
    /// - Returns: current Object
    open func productImage(_ productImage: String) -> Self {
        addItem(PRODUCT_IMAGE, value: productImage as AnyObject)
        return self
    }


    /// Sets the productThumbnail.
    /// - Parameter productThumbnail: String
    /// - Returns: current Object
    open func productThumbnail(_ productThumbnail: String) -> Self {
        addItem(PRODUCT_THUMBNAIL, value: productThumbnail as AnyObject)
        return self
    }


    /// Sets the manufacturer.
    /// - Parameter manufacturer: String
    /// - Returns: current Object
    open func manufacturer(_ manufacturer: String) -> Self {
        addItem(MANUFACTURER, value: manufacturer as AnyObject)
        return self
    }


    /// Sets the sku.
    /// - Parameter sku: String
    /// - Returns: current Object
    open func sku(_ sku: String) -> Self {
        addItem(SKU, value: sku as AnyObject)
        return self
    }


    /// Sets the color.
    /// - Parameter color: String
    /// - Returns: current Object
    open func color(_ color: String) -> Self {
        addItem(COLOR, value: color as AnyObject)
        return self
    }


    /// Sets the size.
    /// - Parameter size: String
    /// - Returns: current Object
    open func size(_ size: String) -> Self {
        addItem(SIZE, value: size as AnyObject)
        return self
    }

    open override func returnSelf() -> AnyObject {
        return self
    }
}
