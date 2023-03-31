//
//  Application.swift
//  Taroter
//
//  Created by Jakub Dąbrowski on 08/02/2023.
//

import Foundation

func logPrint(_ message: String, objects: Any? = nil) {
    print(message)
    guard let objects else { return }
    dump(objects)
}
