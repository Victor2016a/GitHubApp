//
//  GitHubModel.swift
//  GitHubApp
//
//  Created by Victor Vieira on 18/03/22.
//

import Foundation

struct GitHubDetails: Decodable {
  let name: String?
  let language: String?
  let owner: ownerGitHub?
}

struct ownerGitHub: Decodable {
  let login: String?
  let avatar_url: URL?
}
