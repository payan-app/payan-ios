//
//  PYPlacePageView.swift
//  Payan
//
//  Created by Juan Hurtado on 28/05/22.
//

import Foundation
import SwiftUI
import Purace

struct PYPlacePageView: View, PYPlaceViewLogic {
    var placeId: String
    let topSafeAreaPadding: CGFloat
    @StateObject var viewModel = PYPlaceViewModel()
    @State var descriptionHeight: CGFloat = .zero
    
    init(placeId: String) {
        self.placeId = placeId
        let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        topSafeAreaPadding = window?.safeAreaInsets.top ?? .zero
    }
    
    var navBar: some View {
        HStack(alignment: .center) {
            Image(systemName: "chevron.left")
                .foregroundColor(.white)
                .scaleEffect(1.2)
                .onTapGesture {
                    PYRoutingManager.shared.pop()
                }
            Spacer()
        }.padding()
            .frame(height: 50)
            .padding(.top, topSafeAreaPadding)
    }
    
    var image: some View {
        let url = URL(string: viewModel.place.image)
        return ZStack {
            PuraceImageView(url: url)
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.4)
                .clipped()
                .skeleton(with: viewModel.isLoading)
                .shape(type: .rectangle)
                .animation(type: .none)
                .appearance(type: .solid())
            LinearGradient(colors: [.black.opacity(0.4), .clear], startPoint: .top, endPoint: .center)
        }
        .frame(height: UIScreen.main.bounds.height * 0.4)
    }
    
    var title: some View {
        VStack(spacing: 10) {
            HStack {
                if viewModel.isLoading {
                    Spacer(minLength: UIScreen.main.bounds.width * 0.3)
                }
                PuraceTextView(viewModel.place.title, fontSize: 18, weight: .medium)
                    .multilineTextAlignment(.center)
                    .skeleton(with: viewModel.isLoading)
                    .multiline(lines: 1)
                    .animation(type: .none)
                    .appearance(type: .solid())
                    .padding(.vertical, viewModel.isLoading ? 5 : 0)
                if viewModel.isLoading {
                    Spacer(minLength: UIScreen.main.bounds.width * 0.3)
                }
            }
            
            HStack {
                if viewModel.isLoading {
                    Spacer(minLength: UIScreen.main.bounds.width * 0.35)
                }
                PuraceTextView(viewModel.place.subtitle, fontSize: 12, textColor: PuraceStyle.Color.N4)
                    .skeleton(with: viewModel.isLoading)
                    .multiline(lines: 1)
                    .animation(type: .none)
                    .appearance(type: .solid())
                    .padding(.top, viewModel.isLoading ? 5 : 0)
                if viewModel.isLoading {
                    Spacer(minLength: UIScreen.main.bounds.width * 0.35)
                }
            }
        }
    }
    
    var description: some View {
        DescriptionView(text: viewModel.place.description ?? "")
            .skeleton(with: viewModel.isLoading)
            .multiline(lines: 5, scales: [4: 0.5])
            .animation(type: .none)
            .appearance(type: .solid())
            .padding(.top, viewModel.isLoading ? 15 : 0)
    }
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    image
                    title
                        .padding(.top)
                    description
                        .padding()
                    Spacer()
                }
            }
            VStack {
                navBar
                Spacer()
            }
        }
        .edgesIgnoringSafeArea(.top)
        .navigationBarHidden(true)
        .onFirstAppear {
            viewModel.getPlace(id: placeId)
        }
    }
    
    struct DescriptionView: View {
        var text: String

        @State private var height: CGFloat = .zero

        var body: some View {
            InternalLabelView(text: text, dynamicHeight: $height)
                .frame(minHeight: height)
        }

        struct InternalLabelView: UIViewRepresentable {
            var text: String
            @Binding var dynamicHeight: CGFloat

            func makeUIView(context: Context) -> UILabel {
                let label = UILabel()
                label.numberOfLines = 0
                label.textAlignment = .justified
                label.lineBreakMode = .byWordWrapping
                label.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
                label.textColor = UIColor(PuraceStyle.Color.N1)
                label.font = .systemFont(ofSize: 12)
                return label
            }

            func updateUIView(_ uiView: UILabel, context: Context) {
                uiView.text = text
                DispatchQueue.main.async {
                    dynamicHeight = uiView.sizeThatFits(CGSize(width: uiView.bounds.width, height: CGFloat.greatestFiniteMagnitude)).height
                }
            }
        }
    }
}
