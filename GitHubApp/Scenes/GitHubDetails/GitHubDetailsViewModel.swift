//
//  GitHubDetailsViewModel.swift
//  GitHubApp
//
//  Created by Victor Vieira on 23/03/22.
//

import Foundation

class GitHubDetailsViewModel {
  private var apiService = ApiService()
  var gitHubDetails = [GitHubDetails]()
  
  func fetchGitHubDetailsData(from nameSearch: String ,completion: @escaping() -> Void) {
    apiService.getGitHubDetailsData(from: nameSearch) { [weak self] (result) in
      switch result {
      case .success(let listGitHub):
        self?.gitHubDetails = listGitHub
        completion()
      case .failure(let error):
        print("Error Processing json Data: \(error)")
      }
    }
  }
  
  func numberOfRowsInSection(section: Int) -> Int {
    gitHubDetails.count
  }
  
  func cellForRow(at: IndexPath) -> GitHubDetails {
    gitHubDetails[at.row]
  }
}
