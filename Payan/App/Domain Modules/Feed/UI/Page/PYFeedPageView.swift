//
//  PYFeedPageView.swift
//  Payan
//
//  Created by Juan Hurtado on 20/05/22.
//

import Purace
import Kingfisher
import SwiftUI

struct PYFeedPageView: View {
    @StateObject var viewModel = PYFeedViewModel()
    
    var placeCategories: some View {
        VStack {
            VStack(spacing: 5) {
                PuraceTextView("Explora lugares", fontSize: 20, textColor: PuraceStyle.Color.N1)
                PuraceTextView("Adentrate en el corazón de la ciudad blanca", fontSize: 14, textColor: PuraceStyle.Color.N4)
            }.padding(.bottom)
            PuraceVerticalGridView(columns: 1, spacing: 5) {
                ForEach(viewModel.feedData.placeCategories) { category in
                    ZStack {
                        PuraceImageView(url: URL(string: category.image))
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 135)
                            .clipped()
                        Color.black
                            .opacity(0.35)
                        VStack(spacing: 5) {
                            PuraceTextView(category.title, fontSize: 14, textColor: .white, weight: .medium)
                            PuraceTextView("\(category.numberOfPlaces) lugares", textColor: .white)
                        }
                    }
                    .cornerRadius(5)
                    .contentShape(Rectangle())
                    .frame(height: 135)
                    .onTapGesture {
                        guard let url = URL(string: category.deeplink) else { return }
                        PYRoutingManager.shared.open(url: url)
                    }
                        
                }
            }.padding(.horizontal, 16)
        }
    }
    
    var heroes: some View {
        VStack {
            VStack(spacing: 5) {
                PuraceTextView("Próceres", fontSize: 20, textColor: PuraceStyle.Color.N1)
                PuraceTextView("Algunos personajes ilustres de la ciudad", fontSize: 14, textColor: PuraceStyle.Color.N4)
            }.padding(.bottom)
            PuraceCollectionCardView(cards: viewModel.feedData.heroes)
                .padding(.bottom)
            PuraceButtonView("Ver todos", fontSize: 14, type: .quiet) {
                guard let url = URL(string: "payan://collection?type=hero") else { return }
                PYRoutingManager.shared.open(url: url)
            }
        }
    }
    
    var body: some View {
        Group {
            if viewModel.isLoading {
                VStack(spacing: 15) {
                    PuraceLogoLoaderView(percentage: $viewModel.loadedPercentage)
                        .frame(width: 45, height: 70)
                    PuraceTextView("Llegando a Popayán...")
                }
            } else {
                ZStack {
                    ScrollView {
                        VStack(spacing: 40) {
                            placeCategories
                            heroes
                        }
                    }
                    VStack {
                        Spacer()
                        PuraceSnackbarView(
                            title: "Bienvenido",
                            type: .info,
                            isVisible: $viewModel.snackbarIsVisible
                        )
                    }
                }
                
            }
        }
        .background(Color.white)
        .onFirstAppear {
            viewModel.getData()
        }
    }
}

extension PYHeroPreview: PuraceCollectionCardData {
    var deepLink: String { // TODO: remove!!
        ""
    }
    var backgroundImage: URL? {
        URL(string: image)
    }
    var title: String {
        name
    }
}