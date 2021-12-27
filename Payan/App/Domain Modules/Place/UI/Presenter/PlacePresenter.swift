//
//  PlacePresenter.swift
//  Payan
//
//  Created by juandahurt on 15/11/21.
//

import Foundation

protocol PlaceViewInput {
    var selectedPlace: PlaceDetails { get }
}

final class PlacePresenter: BasePresenter {
    var router: PlaceRouter
    private var place: Place
    
    init(place: Place, router: PlaceRouter) {
        self.place = place
        self.router = router
    }
}


extension PlacePresenter: PlaceViewInput {
    var selectedPlace: PlaceDetails {
        PlaceDetails(
            name: place.name,
            imageUrl: place.imageUrl,
            description: place.description
        )
    }
}