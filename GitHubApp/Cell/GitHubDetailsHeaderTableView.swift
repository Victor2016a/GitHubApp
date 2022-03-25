//
//  GitHubDetailsHeaderTableView.swift
//  GitHubApp
//
//  Created by Victor Vieira on 24/03/22.
//

import UIKit

class GitHubDetailsHeaderTableView: UITableViewHeaderFooterView {
  static let identifier = "GitHubDetailsHeaderTableView"
  
  var imageAvatar: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFill
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  var nameAvatar: UILabel = {
    let label = UILabel()
    label.textAlignment = .center
    label.font = .systemFont(ofSize: 20)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  override init(reuseIdentifier: String?) {
    super.init(reuseIdentifier: reuseIdentifier)
    setupHeader()
    setupConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupHeader() {
    addSubview(imageAvatar)
    addSubview(nameAvatar)
  }
  
  private func setupConstraints() {
    NSLayoutConstraint.activate([
      imageAvatar.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
      imageAvatar.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
      imageAvatar.heightAnchor.constraint(equalToConstant: 180),
      imageAvatar.widthAnchor.constraint(equalToConstant: 180),
      imageAvatar.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30),
      
      nameAvatar.topAnchor.constraint(equalTo: imageAvatar.bottomAnchor),
      nameAvatar.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
      nameAvatar.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),

    ])
  }
}
