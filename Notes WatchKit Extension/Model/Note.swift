//
//  Note.swift
//  Notes WatchKit Extension
//
//  Created by Slawek on 14/12/2022.
//

import Foundation

struct Note: Identifiable, Codable {
    let id: UUID
    let text: String
}
