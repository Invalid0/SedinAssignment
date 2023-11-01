//
//  User.swift
//  SedinAssignment
//
//  Created by EMPULSE on 01/11/23.
//

import Foundation


struct User: Codable ,Identifiable {
    let id: Int
    let title: String
    let user: GitHubUser
    let created_at: String
}

struct GitHubUser: Codable {
    let login: String
    let avatar_url: String
}
