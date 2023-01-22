import FirebaseFirestore

extension Firestore {
    var users: CollectionReference {
        collection(Constants.Firebase.Collections.users)
    }

    var buttons: CollectionReference {
        collection(Constants.Firebase.Collections.buttons)
    }

    var icons: CollectionReference {
        collection(Constants.Firebase.Collections.icons)
    }
}
