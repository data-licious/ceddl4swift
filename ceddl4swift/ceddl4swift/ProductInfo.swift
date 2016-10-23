//
//  ProductInfo.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 20/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import Foundation

public class ProductInfo<T>: BaseItem<AnyObject> {

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

    init(parent p: T) {
        parent = p
    }

    public func endProductInfo() -> T {
        return parent
    }

    public func productID(_ productID: String) -> Self {
        addItem(PRODUCT_ID, value: productID as AnyObject)
        return self
    }

    public func productName(_ productName: String) -> Self {
        addItem(PRODUCT_NAME, value: productName as AnyObject)
        return self
    }

    public func description(_ description: String) -> Self {
        addItem(DESCRIPTION, value: description as AnyObject)
        return self
    }

    public func productURL(_ productURL: String) -> Self {
        addItem(PRODUCT_URL, value: productURL as AnyObject)
        return self
    }

    public func productImage(_ productImage: String) -> Self {
        addItem(PRODUCT_IMAGE, value: productImage as AnyObject)
        return self
    }

    public func productThumbnail(_ productThumbnail: String) -> Self {
        addItem(PRODUCT_THUMBNAIL, value: productThumbnail as AnyObject)
        return self
    }

    public func manufacturer(_ manufacturer: String) -> Self {
        addItem(MANUFACTURER, value: manufacturer as AnyObject)
        return self
    }

    public func sku(_ sku: String) -> Self {
        addItem(SKU, value: sku as AnyObject)
        return self
    }

    public func color(_ color: String) -> Self {
        addItem(COLOR, value: color as AnyObject)
        return self
    }

    public func size(_ size: String) -> Self {
        addItem(SIZE, value: size as AnyObject)
        return self
    }

    override func returnSelf() -> AnyObject {
        return self
    }
}
