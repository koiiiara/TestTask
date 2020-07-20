//
//  JSONModel.swift
//  TestTask
//
//  Created by Илья Миронов on 16.07.2020.
//  Copyright © 2020 Ilya Mironov. All rights reserved.
//

import Foundation

struct JSONData: Decodable {
    var data: [JSONObjects]
    var view: [String]
}

struct JSONObjects: Decodable {
    var name: String
    var data: ObjData?
}

struct ObjData: Decodable {
    var text: String?
    var url: String?
    var selectedId: Int?
    var variants: [Variant]?
}

struct Variant: Decodable {
    var id: Int
    var text: String
}
