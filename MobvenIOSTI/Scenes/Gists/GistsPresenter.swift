//
//  GistsPresenter.swift
//  MobvenIOSTI
//
//  Created by Burak Yılmaz on 9.09.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import Foundation
import MobvenExtensions

protocol GistsPresentationLogic: class {
    func presentGists(response: Gists.Fetch.Response)
    func presentShowDetail(response: Gists.ShowDetail.Response)
}

final class GistsPresenter: GistsPresentationLogic {
    
    weak var viewController: GistsDisplayLogic?
    
    func presentGists(response: Gists.Fetch.Response) {
        let gists: [Gists.Fetch.ViewModel.Gist] = response.gists.map({
            Gists.Fetch.ViewModel.Gist(id: $0.id,
                                       description: $0.description,
                                       date: $0.createdAt?.formatDate(with: "MMM-yyyy"),
                                       comments: "\($0.comments ?? 0) comments")
        })
        viewController?.displayGists(
            viewModel: Gists.Fetch.ViewModel(
                gists: gists
            )
        )
    }
    
    func presentShowDetail(response: Gists.ShowDetail.Response) {
        viewController?.displayShowDetail(viewModel: Gists.ShowDetail.ViewModel())
    }
    
}
