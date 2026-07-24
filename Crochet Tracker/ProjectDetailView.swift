//
//  ProjectDetailView.swift
//  Crochet Tracker
//
//  Created by Maithili Nadig on 7/20/26.
//

import SwiftUI

struct ProjectDetailView: View {

    let title: String
    let imageURL: String
    let difficulty: String
    let description: String
    let color: Color

    var body: some View {

        ScrollView {

            VStack(spacing: 16) {

                AsyncImage(url: URL(string: imageURL)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .clipped()
                } placeholder: {
                    ProgressView()
                }
                .frame(maxWidth: .infinity)
                .frame(height: 200)
                .clipped()
                .clipShape(RoundedRectangle(cornerRadius: 20))

                Text(title)
                    .font(.headline)
                    .multilineTextAlignment(.center)

                Text("Watch Tutorial →")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(.secondary)
            }
                    

                VStack(alignment: .leading, spacing: 12) {

                    Text(title)
                        .font(.largeTitle)
                        .fontWeight(.bold)

                    Text(difficulty)
                        .font(.headline)
                        .foregroundColor(.secondary)

                    Text(description)
                        .font(.body)
                }

                Button {

                } label: {

                    Text("Watch Tutorial →")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(color)
                        .clipShape(Capsule())
                }

                Spacer()
            }
            .padding()
        
        .navigationTitle("Project")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {

    NavigationStack {

        ProjectDetailView(
            
                title: "Teddy Bear Plushie",
                imageURL: "https://img.youtube.com/vi/dQw4w9WgXcQ/hqdefault.jpg",
                difficulty: "Beginner",
                description: "A cute beginner-friendly teddy bear project that helps you practice the magic ring and basic crochet stitches.",
                color: Color.pink.opacity(0.20)
            )

    }
}
