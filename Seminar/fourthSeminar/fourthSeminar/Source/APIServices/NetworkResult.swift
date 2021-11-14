//
//  NetworkResult.swift
//  fourthSeminar
//
//  Created by SHIN YOON AH on 2021/10/30.
//

import Foundation

enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
