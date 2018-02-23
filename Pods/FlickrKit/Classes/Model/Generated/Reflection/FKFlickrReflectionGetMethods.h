//
//  FKFlickrReflectionGetMethods.h
//  FlickrKit
//
//  Generated by FKAPIBuilder.
//  Copyright (c) 2013 DevedUp Ltd. All rights reserved. http://www.devedup.com
//
//  DO NOT MODIFY THIS FILE - IT IS MACHINE GENERATED


#import "FKFlickrAPIMethod.h"

typedef NS_ENUM(NSInteger, FKFlickrReflectionGetMethodsError) {
	FKFlickrReflectionGetMethodsError_InvalidAPIKey = 100,		 /* The API key passed was not valid or has expired. */
	FKFlickrReflectionGetMethodsError_ServiceCurrentlyUnavailable = 105,		 /* The requested service is temporarily unavailable. */
	FKFlickrReflectionGetMethodsError_WriteOperationFailed = 106,		 /* The requested operation failed due to a temporary issue. */
	FKFlickrReflectionGetMethodsError_FormatXXXNotFound = 111,		 /* The requested response format was not found. */
	FKFlickrReflectionGetMethodsError_MethodXXXNotFound = 112,		 /* The requested method was not found. */
	FKFlickrReflectionGetMethodsError_InvalidSOAPEnvelope = 114,		 /* The SOAP envelope send in the request could not be parsed. */
	FKFlickrReflectionGetMethodsError_InvalidXMLRPCMethodCall = 115,		 /* The XML-RPC request document could not be parsed. */
	FKFlickrReflectionGetMethodsError_BadURLFound = 116,		 /* One or more arguments contained a URL that has been used for abuse on Flickr. */

};

/*

Returns a list of available flickr API methods.


Response:

<methods>
	<method>flickr.blogs.getList</method>
	<method>flickr.blogs.postPhoto</method>
	<method>flickr.contacts.getList</method>
	<method>flickr.contacts.getPublicList</method>
</methods>

*/
@interface FKFlickrReflectionGetMethods : NSObject <FKFlickrAPIMethod>


@end
