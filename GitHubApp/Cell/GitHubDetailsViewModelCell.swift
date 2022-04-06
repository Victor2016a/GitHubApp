//
//  GitHubDetailsViewModelCell.swift
//  GitHubApp
//
//  Created by Victor Vieira on 04/04/22.
//

import Foundation

class GitHubDetailsViewModelCell {
  var nameProject: String?
  var languageProject: String?
  
  init(nameProject: String, languageProject: String?) {
    self.nameProject = nameProject
    self.languageProject = languageProject
  }
}
