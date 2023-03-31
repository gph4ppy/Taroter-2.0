//
//  UserManager.swift
//  Taroter
//
//  Created by Jakub Dąbrowski on 31/03/2023.
//

import SwiftUI

struct UserManager {
    @AppStorage("Username") var name: String = ""
    @AppStorage("Birthday") var birthday: String?
    @AppStorage("Avatar") var avatar: Data?
}
