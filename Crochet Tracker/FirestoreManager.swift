//
//  FirestoreManager.swift
//  Crochet Tracker
//
//  Created by Maithili Nadig on 7/22/26.
//

import SwiftUI
import Combine
import FirebaseFirestore

class FirestoreManager: ObservableObject {
    @Published var projects: [Project] = []
    private let db = Firestore.firestore()

    init() {
        fetchProjects()
    }

    func fetchProjects() {

        db.collection("projects").getDocuments { snapshot, error in

            guard let documents = snapshot?.documents else {
                print("No documents found")
                return
            }

            self.projects = documents.compactMap { document in

                let data = document.data()

                return Project(
                    title: data["title"] as? String ?? "",
                    category: data["category"] as? String ?? "",
                    difficulty: data["difficulty"] as? String ?? "",
                    description: data["description"] as? String ?? "",
                    youtubeURL: data["youtubeURL"] as? String ?? ""
                )

            }

        }

    }

}
