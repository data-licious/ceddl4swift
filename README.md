# Ceddl4swift - A CEDDL data layer from Swift #

## About Ceddl4swift ##

Ceddl4swift is a swift framework for a website data layer compliant with the [CEDDL specification](http://www.w3.org/2013/12/ceddl-201312.pdf).

The Customer Experience Digital Data Layer (CEDDL) specification 
> "describes a method for surfacing customer experience digital data on a web or other digital resource as a JavaScript Object which can be used for communicating this data to digital analytics and reporting servers."

The code design is followed from [Ceddl4j:A Java component for a website data layer compliant with the CEDDL specification.](https://github.com/mirabeau-nl/ceddl4j), for the easy integration on differnt platforms.

For more background information, see article [Ceddl4j: What & why?](https://github.com/mirabeau-nl/ceddl4j/wiki/Ceddl4j:-What-&-why%3F) 

### Example ###
To build the following Data Layer:
                
            digitalData = {
                pageInstanceID: "MyHomePage-Production",
                page:{
                    pageInfo:{
                        pageID: "Home Page",
                        destinationURL: "http://mysite.com/index.html"
                    },
                    category:{
                        primaryCategory: "FAQ Pages",
                        subCategory1: "ProductInfo",
                        pageType: "FAQ"
                    },
                    attributes:{
                        country: "US",
                        language: "en-US"
                    }
                }
            };

 You can use this code:

            let digitalData = DigitalData.create("MyHomePage-Production")
                                         .page()
                                         .pageInfo()
                                         .pageID("Home Page")
                                         .destinationURL("http://mysite.com/index.html")
                                         .endPageInfo()
                                         .addPrimaryCategory("FAQ Pages")
                                         .addCategory("subCategory1", "ProductInfo")
                                         .addCategory("pageType", "FAQ")
                                         .addAttribute("country", "US")
                                         .addAttribute("language", "en-US")
                                         .endPage()
    
### Contribution guidelines ###
* Comments, methods and variables in English.
* Create unit tests where possible.
* Try to stick to the existing coding style.
* Give a short description in the pull request what you're doing and why.

### Installation ###
It is hosted on Cocoa Pods, you can

`pod 'Ceddl4Swift'`

to include in your project. For more information see [Cocoa Pods](https://cocoapods.org/)

### License information ###

	Copyright (c) 2016, Datalicious.
	All rights reserved.

	Redistribution and use in source and binary forms, with or without
	modification, are permitted provided that the following conditions are met:
		* Redistributions of source code must retain the above copyright
		notice, this list of conditions and the following disclaimer.
		* Redistributions in binary form must reproduce the above copyright
		notice, this list of conditions and the following disclaimer in the
		documentation and/or other materials provided with the distribution.
		* Neither the name of Datalicious nor the
		names of its contributors may be used to endorse or promote products
		derived from this software without specific prior written permission.

	THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
	ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
	WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
	DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY
	DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
	(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
	LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
	ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
	(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
	SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
