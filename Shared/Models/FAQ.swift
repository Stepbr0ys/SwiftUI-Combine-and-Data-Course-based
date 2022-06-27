//
//  FAQ.swift
//  CombineAndData
//
//  Created by Борис Ларионов on 28.01.2022.
//

import Foundation

struct FAQ: Identifiable, Decodable {
    var id: Int
    var question: String
    var answer: String
}
