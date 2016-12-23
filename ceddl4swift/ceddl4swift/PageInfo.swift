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


    /// init an PageInfo object.
    /// - Parameter parent: The parent Object
    public init(parent p: Page) {
        parent = p
    }


    /// Returns to the parent Page object.
    /// - Returns: parent Page object
    public func endPageInfo() -> Page {
        return parent
    }


    /// Sets the pageID.
    ///
    /// An identifier for a page or other piece of content, may be unique only
    /// within a particular environment.
    ///
    /// - Parameter pageID: String
    /// - Returns: current PageInfo
    public func pageID(pageID: String) -> Self {
        super.addItem(PageInfo.PAGE_ID, value: pageID as AnyObject)
        return self
    }


    /// Sets the pageName.
    /// - Parameter pageName: String
    /// - Returns: current PageInfo
    public func pageName(pageName: String) -> Self {
        super.addItem(PageInfo.PAGE_NAME, value: pageName as AnyObject)
        return self
    }


    /// Sets the destinationURL.
    ///
    /// For destinationURL RECOMMENDED value is document.location.
    ///
    /// - Parameter destinationURL: String
    /// - Returns: current PageInfo
    public func destinationURL(destinationURL: String) -> Self {
        super.addItem(PageInfo.DESTINATION_URL, value: destinationURL as AnyObject)
        return self
    }


    /// Sets the referringURL.
    ///
    /// For referringURL RECOMMENDED value is document.referrer
    ///
    /// - Parameter referringURL: String
    /// - Returns: current PageInfo
    public func referringURL(referringURL: String) -> Self {
        super.addItem(PageInfo.REFERRING_URL, value: referringURL as AnyObject)
        return self
    }


    /// Sets the sysEnv.
    /// - Parameter sysEnv: String
    /// - Returns: current PageInfo
    public func sysEnv(sysEnv: String) -> Self {
        super.addItem(PageInfo.SYS_ENV, value: sysEnv as AnyObject)
        return self
    }


    /// Sets the variant.
    /// - Parameter variant: String
    /// - Returns: current PageInfo
    public func variant(variant: String) -> Self {
        super.addItem(PageInfo.VARIANT, value: variant as AnyObject)
        return self
    }


    /// Sets the version.
    /// - Parameter version: String
    /// - Returns: current PageInfo
    public func version(version: String) -> Self {
        super.addItem(PageInfo.VERSION, value: version as AnyObject)
        return self
    }


    /// Sets the breadCrumbs.
    /// - Parameter breadCrumbs: Array of string
    /// - Returns: current PageInfo
    public func breadCrumbs(breadCrumbs: Array<String>) -> Self {
        super.addItem(PageInfo.BREADCRUMBS, value: breadCrumbs as AnyObject)
        return self
    }


    /// Sets the author.
    /// - Parameter author: String
    /// - Returns: current PageInfo
    public func author(author: String) -> Self {
        super.addItem(PageInfo.AUTHOR, value: author as AnyObject)
        return self
    }


    /// Sets the issueDate.
    /// - Parameter issueDate: String
    /// - Returns: current PageInfo
    public func issueDate(issueDate: String) -> Self {
        super.addItem(PageInfo.ISSUE_DATE, value: issueDate as AnyObject)
        return self
    }


    /// Sets the issueDate.
    /// - Parameter issueDate: Date
    /// - Returns: current PageInfo
    public func issueDate(issueDate: NSDate) -> Self {
        let issueDateString = dateToString(issueDate)
        super.addItem(PageInfo.ISSUE_DATE, value: issueDateString as AnyObject)
        return self
    }


    /// Sets the effectiveDate.
    /// - Parameter author: effectiveDate
    /// - Returns: current PageInfo
    public func effectiveDate(effectiveDate: String) -> Self {
        super.addItem(PageInfo.EFFECTIVE_DATE, value: effectiveDate as AnyObject)
        return self
    }


    /// Sets the effectiveDate.
    /// - Parameter effectiveDate: Date
    /// - Returns: current PageInfo
    public func effectiveDate(effectiveDate: NSDate) -> Self {
        let effectiveDateString = dateToString(effectiveDate)
        super.addItem(PageInfo.EFFECTIVE_DATE, value: effectiveDateString as AnyObject)
        return self
    }


    /// Sets the expiryDate.
    /// - Parameter expiryDate: String
    /// - Returns: current PageInfo
    public func expiryDate(expiryDate: String) -> Self {
        super.addItem(PageInfo.EXPIRY_DATE, value: expiryDate as AnyObject)
        return self
    }


    /// Sets the expiryDate.
    /// - Parameter expiryDate: Date
    /// - Returns: current PageInfo
    public func expiryDate(expiryDate: NSDate) -> Self {
        let expiryDateString = dateToString(expiryDate)
        super.addItem(PageInfo.EXPIRY_DATE, value: expiryDateString as AnyObject)
        return self
    }


    /// Sets the language.
    ///
    /// For fields containing language or locale, ISO 3166 and 639 are
    /// RECOMMENDED.
    ///
    /// - Parameter language: String
    /// - Returns: current PageInfo
    public func language(language: String) -> Self {
        super.addItem(PageInfo.LANGUAGE, value: language as AnyObject)
        return self
    }


    /// Sets the geoRegion.
    /// - Parameter geoRegion: String
    /// - Returns: current PageInfo
    public func geoRegion(geoRegion: String) -> Self {
        super.addItem(PageInfo.GEO_REGION, value: geoRegion as AnyObject)
        return self
    }


    /// Sets the industryCodes.
    /// - Parameter industryCodes: String
    /// - Returns: current PageInfo
    public func industryCodes(industryCodes: String) -> Self {
        super.addItem(PageInfo.INDUSTRY_CODES, value: industryCodes as AnyObject)
        return self
    } 


    /// Sets the publisher.
    /// - Parameter publisher: String
    /// - Returns: current PageInfo
    public func publisher(publisher: String) -> Self {
        super.addItem(PageInfo.PUBLISHER, value: publisher as AnyObject)
        return self
    }


    /// Sets the onsiteSearchTerm.
    ///
    /// The properties onsiteSearchTerm and onsiteSearchResults are RECOMMENDED
    /// for measuring the query term and number of results returned for onsite
    /// search functions.
    ///
    /// - Parameter onsiteSearchTerm: String
    /// - Returns: current PageInfo
    public func onsiteSearchTerm(onsiteSearchTerm: String) -> Self {
        super.addItem(PageInfo.ONSITE_SEARCH_TERMS, value: onsiteSearchTerm as AnyObject)
        return self
    }


    /// Sets the onsiteSearchResults.
    ///
    /// The properties onsiteSearchTerm and onsiteSearchResults are RECOMMENDED
    /// for measuring the query term and number of results returned for onsite
    /// search functions.
    ///
    /// - Parameter onsiteSearchResults: NSNumber
    /// - Returns: current PageInfo
    public func onsiteSearchResults(onsiteSearchResults: NSNumber) -> Self {
        super.addItem(PageInfo.ONSITE_SEARCH_RESULTS, value: onsiteSearchResults)
        return self
    }

    public override func returnSelf() -> AnyObject {
        return self
    }
}
