import SwiftUI

struct ContentView: View {


let filters = ["All", "Beginner", "Intermediate", "Advanced"]

let categories = [
    "Plushies",
    "Bags",
    "Clothing",
    "Home Decor",
    "Accessories"
]

let columns = [
    GridItem(.flexible(), spacing: 16),
    GridItem(.flexible(), spacing: 16)
]

@State private var selectedFilter = "All"
@State private var selectedCategory = "Plushies"
@StateObject private var firestore = FirestoreManager()

var body: some View {

    NavigationStack {

        ScrollView {

            VStack(alignment: .leading, spacing: 22) {

                // MARK: Header

                VStack(alignment: .leading, spacing: 8) {

                    Text("🧶 Cozy Crochet")
                        .font(.largeTitle)
                        .fontWeight(.bold)

                    Text("Find your next project")
                        .font(.subheadline)
                        .foregroundColor(.secondary)

                }
                .padding(.horizontal)

                // MARK: Difficulty Filters

                ScrollView(.horizontal, showsIndicators: false) {

                    HStack(spacing: 12) {

                        ForEach(filters, id: \.self) { filter in

                            Text(filter)
                                .font(.subheadline)
                                .fontWeight(.medium)
                                .padding(.horizontal, 10)
                                .padding(.vertical, 10)
                                .background(
                                    selectedFilter == filter
                                    ? Color.pink.opacity(0.22)
                                    : Color.white
                                )
                                .overlay(
                                    Capsule()
                                        .stroke(
                                            selectedFilter == filter
                                            ? Color.pink.opacity(0.45)
                                            : Color.gray.opacity(0.12),
                                            lineWidth: 1
                                        )
                                )
                                .clipShape(Capsule())
                                .onTapGesture {
                                    selectedFilter = filter
                                }
                        }
                    }
                    .padding(.leading)
                    .padding(.trailing, 32)
                }

                // MARK: Categories

                ScrollView(.horizontal, showsIndicators: false) {

                    HStack(spacing: 12) {

                        ForEach(categories, id: \.self) { category in

                            Text(category)
                                .font(.subheadline)
                                .fontWeight(.medium)
                                .padding(.horizontal, 14)
                                .padding(.vertical, 9)
                                .background(
                                    selectedCategory == category
                                    ? Color.purple.opacity(0.18)
                                    : Color.white
                                )
                                .overlay(
                                    Capsule()
                                        .stroke(
                                            selectedCategory == category
                                            ? Color.purple.opacity(0.35)
                                            : Color.gray.opacity(0.12),
                                            lineWidth: 1
                                        )
                                )
                                .clipShape(Capsule())
                                .onTapGesture {
                                    selectedCategory = category
                                }
                        }
                    }
                    .padding(.leading)
                    .padding(.trailing, 32)
                }

                // MARK: Pinterest Grid

                LazyVGrid(columns: columns, spacing: 18) {

                    ForEach(firestore.projects) { project in

                        NavigationLink {

                            ProjectDetailView(
                                title: project.title,
                                imageURL: thumbnailURL(from: project.youtubeURL),
                                difficulty: project.difficulty,
                                description: project.description,
                                color: cardColor(for: project.category)
                            )

                        } label: {

                            CozyPlaceholderCard(
                                title: project.title,
                                imageURL: thumbnailURL(from: project.youtubeURL),
                                color: cardColor(for: project.category)
                            )

                        }

                    }
                }
                .padding(.horizontal)

            }
            .padding(.top)
            .padding(.bottom, 20)
        }
        .background(
            Color(
                red: 0.995,
                green: 0.985,
                blue: 0.975
            )
        )
        .navigationBarHidden(true)
    }
}

func cardColor(for category: String) -> Color {

    switch category {

    case "Plushies":
        return Color.pink.opacity(0.20)

    case "Bags":
        return Color.purple.opacity(0.16)

    case "Clothing":
        return Color.green.opacity(0.16)

    case "Home Decor":
        return Color.yellow.opacity(0.20)

    case "Accessories":
        return Color.orange.opacity(0.18)

    default:
        return Color.gray.opacity(0.18)

    }

}

}
func thumbnailURL(from youtubeURL: String) -> String {

    if let id = youtubeURL.components(separatedBy: "v=").last {
        return "https://img.youtube.com/vi/\(id)/hqdefault.jpg"
    }

    return ""

}

struct CozyPlaceholderCard: View {


let title: String
let imageURL: String
let color: Color

var body: some View {

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
        .frame(height: 100)
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
    .frame(maxWidth: .infinity)
    .frame(height: 240)
    .background(color)
    .overlay(
        RoundedRectangle(cornerRadius: 28)
            .stroke(
                Color.white.opacity(0.75),
                lineWidth: 1.5
            )
    )
    .clipShape(
        RoundedRectangle(cornerRadius: 28)
    )
    .shadow(
        color: Color.black.opacity(0.05),
        radius: 12,
        x: 0,
        y: 6
    )
}


}

#Preview {
ContentView()
}
