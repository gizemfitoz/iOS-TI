//
//  GistDetailPresenter.swift
//  MobvenIOSTI
//
//  Created by Burak Yılmaz on 9.09.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import Foundation
import UIKit
import MobvenExtensions

protocol GistDetailPresentationLogic: class {
    func presentGistDetail(response: GistDetail.FetchDetail.Response)
    func presentUpdateFavorite(response: GistDetail.UpdateFavorite.Response)
}

final class GistDetailPresenter: GistDetailPresentationLogic {
    
    weak var viewController: GistDetailDisplayLogic?
    
    func presentGistDetail(response: GistDetail.FetchDetail.Response) {
        let comments = response.gist.comments == 0 ? "No Comments" : "Comments: \(response.gist.comments ?? 0)"
        viewController?.displayGistDetail(
            viewModel: GistDetail.FetchDetail.ViewModel(
                imageURL: response.gist.avatarUrl ?? "",
                id: "Identifier:\n\(response.gist.id ?? "")",
                url: response.gist.url,
                date: "Created At:\n\(response.gist.createdAt?.formatDate(with: "MMM-yyyy") ?? "")",
                description: "Description\n\(response.gist.description ?? "")",
                comments: "Comments:\n\(comments)")
        )
    }
    
    func presentUpdateFavorite(response: GistDetail.UpdateFavorite.Response) {
        var viewModel: GistDetail.UpdateFavorite.ViewModel
        if response.isFavorite {
            viewModel = .init(image: UIImage(imageLiteralResourceName: "heart"))
        } else {
            viewModel = .init(image: UIImage(imageLiteralResourceName: "unheart"))
        }
        viewController?.displayFavoriteUpdate(viewModel: viewModel)
    }
    
}
