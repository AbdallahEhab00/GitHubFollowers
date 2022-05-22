//
//  ErrorMessages.swift
//  GitHubFollowers
//
//  Created by Abdallah Ehab on 14/05/2022.
//

import Foundation

enum GFError: String , Error{
    case invalidUserName   = "The usernamed Created invalid request. Please try again."
    case unableToComplete  = "Unable to Complete your Request. please Check internet Connection"
    case invalidResponse   = "invalid Response from Server. please Check The username and try again."
    case invalidData       = "The data Recived from server was invalid. please try again."
}
