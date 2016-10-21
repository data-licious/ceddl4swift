//
//  PageInfo.swift
//  ceddl4swift
//
//  Created by Sachin Vas on 20/10/16.
//  Copyright © 2016 Sachin Vas. All rights reserved.
//

import Foundation

public class PageInfo: BaseItem<PageInfo> {

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

    public func pageID(pageID: String) -> Self {
        super.addItem(field: PageInfo.PAGE_ID, value: pageID as AnyObject)
        return self
    }

    public func pageName(pageName: String) -> Self {
        super.addItem(field: PageInfo.PAGE_NAME, value: pageName as AnyObject)
        return self
    }

    public func destinationURL(destinationURL: String) -> Self {
        super.addItem(field: PageInfo.DESTINATION_URL, value: destinationURL as AnyObject)
        return self
    }

    public func referringURL(referringURL: String) -> Self {
        super.addItem(field: PageInfo.REFERRING_URL, value: referringURL as AnyObject)
        return self
    }

    public func sysEnv(sysEnv: String) -> Self {
        super.addItem(field: PageInfo.SYS_ENV, value: sysEnv as AnyObject)
        return self
    }

    public func variant(variant: String) -> Self {
        super.addItem(field: PageInfo.VARIANT, value: variant as AnyObject)
        return self
    }

    public func version(version: String) -> Self {
        super.addItem(field: PageInfo.VERSION, value: version as AnyObject)
        return self
    }

    public func breadCrumbs(breadCrumbs: Array<String>) -> Self {
        super.addItem(field: PageInfo.BREADCRUMBS, value: breadCrumbs as AnyObject)
        return self
    }

    public func author(author: String) -> Self {
        super.addItem(field: PageInfo.AUTHOR, value: author as AnyObject)
        return self
    }

    public func issueDate(issueDate: String) -> Self {
        super.addItem(field: PageInfo.ISSUE_DATE, value: issueDate as AnyObject)
        return self
    }

    public func issueDate(issueDate: Date) -> Self {
        super.addItem(field: PageInfo.ISSUE_DATE, value: issueDate as AnyObject)
        return self
    }

    public func effectiveDate(effectiveDate: String) -> Self {
        super.addItem(field: PageInfo.EFFECTIVE_DATE, value: effectiveDate as AnyObject)
        return self
    }

    public func effectiveDate(effectiveDate: Date) -> Self {
        super.addItem(field: PageInfo.EFFECTIVE_DATE, value: effectiveDate as AnyObject)
        return self
    }

    public func expiryDate(expiryDate: String) -> Self {
        super.addItem(field: PageInfo.EXPIRY_DATE, value: expiryDate as AnyObject)
        return self
    }

    public func expiryDate(expiryDate: Date) -> Self {
        super.addItem(field: PageInfo.EXPIRY_DATE, value: expiryDate as AnyObject)
        return self
    }

    public func langauage(langauage: String) -> Self {
        super.addItem(field: PageInfo.LANGUAGE, value: langauage as AnyObject)
        return self
    }

    public func geoRegion(geoRegion: String) -> Self {
        super.addItem(field: PageInfo.GEO_REGION, value: geoRegion as AnyObject)
        return self
    }

    public func industryCodes(industryCodes: String) -> Self {
        super.addItem(field: PageInfo.INDUSTRY_CODES, value: industryCodes as AnyObject)
        return self
    }

    public func publisher(publisher: String) -> Self {
        super.addItem(field: PageInfo.PUBLISHER, value: publisher as AnyObject)
        return self
    }

    public func onsiteSearchTerm(onsiteSearchTerm: String) -> Self {
        super.addItem(field: PageInfo.ONSITE_SEARCH_TERMS, value: onsiteSearchTerm as AnyObject)
        return self
    }

    public func onsiteSearchResults(onsiteSearchResults: String) -> Self {
        super.addItem(field: PageInfo.ONSITE_SEARCH_RESULTS, value: onsiteSearchResults as AnyObject)
        return self
    }

    override func returnSelf() -> PageInfo {
        return self
    }
}
