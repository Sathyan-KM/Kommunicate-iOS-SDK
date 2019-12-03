//
//  KMErrors.swift
//  Kommunicate
//
//  Created by Sunil on 29/11/19.
//
import Foundation

/// Represents all the errors which can happen during creating conversation.
public enum KMConversationError : LocalizedError {
    /// Thrown when title is invalid.
    case invalidTitle
    /// Thrown when user is not logged in.
    case notLoggedIn
    /// Thrown when Internet is not available.
    case internet
    /// Thrown when an error occurs while calling an API
    /// - Parameter error: The underlying error object.
    case api(_ error: Error?)

    public var errorDescription: String? {
        var errorMessage: String
        switch self {
        case .invalidTitle:
            errorMessage = "Please pass a valid title."
        case .notLoggedIn:
            errorMessage = "User is not logged in."
        case .internet:
            errorMessage = "Internet is not available."
        case .api(let error):
            if let apiError = error {
                errorMessage = apiError.localizedDescription
            } else {
                errorMessage = "Failed to proccess API request"
            }
        }
        return errorMessage
    }
}

/// Represents all the errors which can happen while fetching an away message and deafult agent.
public enum APIError: LocalizedError {

    ///Thrown when building a URL .
    case urlBuilding
    ///Thrown in case of JSON conversion failure.
    case jsonConversion
    ///Thrown when last message is not present.
    case messageNotPresent

    public var errorDescription: String? {
        var errorMessage: String
        switch self {
        case .urlBuilding:
            errorMessage = "Failed to create a URL."
        case .jsonConversion:
            errorMessage = "Failed while converting the data to JSON format."
        case .messageNotPresent:
            errorMessage = "Failed to get last message."
        }
        return errorMessage
    }
}
