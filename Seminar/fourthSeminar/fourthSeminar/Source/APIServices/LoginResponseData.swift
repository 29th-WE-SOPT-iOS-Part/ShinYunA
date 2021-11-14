//
//  LoginResponseData.swift
//  fourthSeminar
//
//  Created by SHIN YOON AH on 2021/10/30.
//

import Foundation

struct LoginResponseData: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: LoginResultData?
}

// MARK: - UserData
struct LoginResultData: Codable {
    let id: Int
    let name, email: String
}
