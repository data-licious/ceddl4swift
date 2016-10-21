//
//  ProductInfo.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 20/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import Foundation

public class ProductInfo<T>: BaseItem<ProductInfo> {

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

    public func endProduct() -> T {
        return parent
    }

    public func productID(productID: String) -> ProductInfo<T> {
        addItem(field: PRODUCT_ID, value: productID as AnyObject)
        return self
    }

    public func productName(productName: String) -> ProductInfo<T> {
        addItem(field: PRODUCT_NAME, value: productName as AnyObject)
        return self
    }

    public func description(description: String) -> ProductInfo<T> {
        addItem(field: DESCRIPTION, value: description as AnyObject)
        return self
    }

    public func productURL(productURL: String) -> ProductInfo<T> {
        addItem(field: PRODUCT_URL, value: productURL as AnyObject)
        return self
    }

    public func productImage(productImage: String) -> ProductInfo<T> {
        addItem(field: PRODUCT_IMAGE, value: productImage as AnyObject)
        return self
    }

    public func productThumbnail(productThumbnail: String) -> ProductInfo<T> {
        addItem(field: PRODUCT_THUMBNAIL, value: productThumbnail as AnyObject)
        return self
    }

    public func manufacturer(manufacturer: String) -> ProductInfo<T> {
        addItem(field: MANUFACTURER, value: manufacturer as AnyObject)
        return self
    }

    public func sku(sku: String) -> ProductInfo<T> {
        addItem(field: SKU, value: sku as AnyObject)
        return self
    }

    public func color(color: String) -> ProductInfo<T> {
        addItem(field: COLOR, value: color as AnyObject)
        return self
    }

    public func size(color: String) -> ProductInfo<T> {
        addItem(field: SIZE, value: size as AnyObject)
        return self
    }

    override func returnSelf() -> ProductInfo<T> {
        return self
    }
}
