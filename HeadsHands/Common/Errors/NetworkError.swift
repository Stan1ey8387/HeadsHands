//
//  NetworkError.swift
//  HeadsHands
//
//  Created by Захар Бабкин on 07/02/2019.
//  Copyright © 2019 Захар Бабкин. All rights reserved.
//

import Foundation


enum NetworkError: Error {
    case badData
    case badJson
    case noInterner
}

extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .badData:
            return NSLocalizedString("Произошла ошибка сервера. Повторите попытку позже.", comment: "Ошибка интернет запроса")
        case .badJson:
            return NSLocalizedString("Произошла ошибка сервера. Повторите попытку позже.", comment: "Ошибка интернет запроса")
        case .noInterner:
            return NSLocalizedString("Нет интернет-соединения, проверьте подключение и повторите попытку", comment: "Ошибка интернет запроса")
        }
    }
}
