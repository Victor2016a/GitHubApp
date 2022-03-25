//
//  ApiService.swift
//  GitHubApp
//
//  Created by Victor Vieira on 18/03/22.
//

import Foundation

class ApiService {
  private var dataTask: URLSessionDataTask?
  private let baseURL = "https://api.github.com/users/"
  
  func getGitHubDetailsData(complention: @escaping (Result<[GitHubDetails], Error>) -> Void) {
    let gitHubURL = baseURL + "yan-victor21" + "/repos"
    
    guard let url = URL(string: gitHubURL) else { return }
    
    self.dataTask = URLSession.shared.dataTask(with: url, completionHandler: { data, _ , error in
      DispatchQueue.main.async {
        if let error = error {
          complention(.failure(error))
          return
        }
        guard let data = data else { return }

        do {
          let jsonData = try JSONDecoder().decode([GitHubDetails].self, from: data)
          complention(.success(jsonData))
        }
        catch let error {
          complention(.failure(error))
        }
      }
    })
    self.dataTask?.resume()
  }
}
