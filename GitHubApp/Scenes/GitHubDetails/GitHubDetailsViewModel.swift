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
  var nameSearch: String
  
  init(nameSearch: String) {
    self.nameSearch = nameSearch
  }
  
  func fetchGitHubDetailsData(completion: @escaping (Result<[GitHubDetails], Error>) -> Void) {
    apiService.getGitHubDetailsData(from: nameSearch) { [weak self] (result) in
      switch result {
      case .success(let listGitHub):
        self?.gitHubDetails = listGitHub
        completion(.success(listGitHub))
      case .failure(let error):
        completion(.failure(error))
      }
    }
  }
  
  func numberOfRowsInSection(section: Int) -> Int {
    gitHubDetails.count
  }
  
  func cellForRow(at indexPath: IndexPath) -> GitHubDetailsViewModelCell {
    let gitHubDetail = gitHubDetails[indexPath.row]
    return .init(
      nameProject: gitHubDetail.name ?? "",
      languageProject: gitHubDetail.language ?? ""
    )
  }
}
