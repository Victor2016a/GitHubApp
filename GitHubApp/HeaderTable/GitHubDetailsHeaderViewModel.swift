//
//  GitHubDetailsHeaderViewModel.swift
//  GitHubApp
//
//  Created by Victor Vieira on 07/04/22.
//

import Foundation

class GitHubDetailsHeaderViewModel {
  var login: String?
  var avatar_url: URL?
  
  init(login: String, avatar_url: URL) {
    self.login = login
    self.avatar_url = avatar_url
  }
}
