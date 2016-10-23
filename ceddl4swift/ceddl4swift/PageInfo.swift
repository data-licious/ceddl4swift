//
//  PageInfo.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 20/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import Foundation

public class PageInfo: BaseItem<AnyObject> {

    private static let AUTHOR = "author"
    private static let BREADCRUMBS = "breadcrumbs"
    private static let DESTINATION_URL = "destinationURL"
    private static let EFFECTIVE_DATE = "effectiveDate"
    private static let EXPIRY_DATE = "expiryDate"
    private static let GEO_REGION = "geoRegion"
    private static let INDUSTRY_CODES = "industryCodes"
    private static let ISSUE_DATE = "issueDate"
    private static let LANGUAGE = "language"
    private static let ONSITE_SEARCH_RESULTS = "onsiteSearchResults"
    private static let ONSITE_SEARCH_TERMS = "onsiteSearchTerm"
    private static let PAGE_ID = "pageID"
    private static let PAGE_NAME = "pageName"
    private static let PUBLISHER = "publisher"
    private static let REFERRING_URL = "referringURL"
    private static let SYS_ENV = "sysEnv"
    private static let VARIANT = "variant"
    private static let VERSION = "version"

    private var parent: Page!

    init(parent p: Page) {
        parent = p
    }

    public func endPageInfo() -> Page {
        return parent
    }

    public func pageID(_ pageID: String) -> Self {
        super.addItem(PageInfo.PAGE_ID, value: pageID as AnyObject)
        return self
    }

    public func pageName(_ pageName: String) -> Self {
        super.addItem(PageInfo.PAGE_NAME, value: pageName as AnyObject)
        return self
    }

    public func destinationURL(_ destinationURL: String) -> Self {
        super.addItem(PageInfo.DESTINATION_URL, value: destinationURL as AnyObject)
        return self
    }

    public func referringURL(_ referringURL: String) -> Self {
        super.addItem(PageInfo.REFERRING_URL, value: referringURL as AnyObject)
        return self
    }

    public func sysEnv(_ sysEnv: String) -> Self {
        super.addItem(PageInfo.SYS_ENV, value: sysEnv as AnyObject)
        return self
    }

    public func variant(_ variant: String) -> Self {
        super.addItem(PageInfo.VARIANT, value: variant as AnyObject)
        return self
    }

    public func version(_ version: String) -> Self {
        super.addItem(PageInfo.VERSION, value: version as AnyObject)
        return self
    }

    public func breadCrumbs(_ breadCrumbs: Array<String>) -> Self {
        super.addItem(PageInfo.BREADCRUMBS, value: breadCrumbs as AnyObject)
        return self
    }

    public func author(_ author: String) -> Self {
        super.addItem(PageInfo.AUTHOR, value: author as AnyObject)
        return self
    }

    public func issueDate(_ issueDate: String) -> Self {
        super.addItem(PageInfo.ISSUE_DATE, value: issueDate as AnyObject)
        return self
    }

    public func issueDate(_ issueDate: Date) -> Self {
        let issueDateString = dateToString(date: issueDate)
        super.addItem(PageInfo.ISSUE_DATE, value: issueDateString as AnyObject)
        return self
    }

    public func effectiveDate(_ effectiveDate: String) -> Self {
        super.addItem(PageInfo.EFFECTIVE_DATE, value: effectiveDate as AnyObject)
        return self
    }

    public func effectiveDate(_ effectiveDate: Date) -> Self {
        let effectiveDateString = dateToString(date: effectiveDate)
        super.addItem(PageInfo.EFFECTIVE_DATE, value: effectiveDateString as AnyObject)
        return self
    }

    public func expiryDate(_ expiryDate: String) -> Self {
        super.addItem(PageInfo.EXPIRY_DATE, value: expiryDate as AnyObject)
        return self
    }

    public func expiryDate(_ expiryDate: Date) -> Self {
        let expiryDateString = dateToString(date: expiryDate)
        super.addItem(PageInfo.EXPIRY_DATE, value: expiryDateString as AnyObject)
        return self
    }

    public func language(_ language: String) -> Self {
        super.addItem(PageInfo.LANGUAGE, value: language as AnyObject)
        return self
    }

    public func geoRegion(_ geoRegion: String) -> Self {
        super.addItem(PageInfo.GEO_REGION, value: geoRegion as AnyObject)
        return self
    }

    public func industryCodes(_ industryCodes: String) -> Self {
        super.addItem(PageInfo.INDUSTRY_CODES, value: industryCodes as AnyObject)
        return self
    } 

    public func publisher(_ publisher: String) -> Self {
        super.addItem(PageInfo.PUBLISHER, value: publisher as AnyObject)
        return self
    }

    public func onsiteSearchTerm(_ onsiteSearchTerm: String) -> Self {
        super.addItem(PageInfo.ONSITE_SEARCH_TERMS, value: onsiteSearchTerm as AnyObject)
        return self
    }

    public func onsiteSearchResults(_ onsiteSearchResults: NSNumber) -> Self {
        super.addItem(PageInfo.ONSITE_SEARCH_RESULTS, value: onsiteSearchResults)
        return self
    }

    override func returnSelf() -> AnyObject {
        return self
    }
}
