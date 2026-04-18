//
//  Parent.swift
//  TCA26StoreTaskIDTesting
//
//  Created by Rhys Morgan on 18/04/2026.
//

import ComposableArchitecture

@Feature
struct Parent {
  struct State {
    @StoreTaskID var loadingChildren

    var children: IdentifiedArrayOf<Child.State> = []
  }

  enum Action {
    case receivePosts([Post])
    case child(Child.State.ID, Child.Action)
  }

  @Dependency(\.uuid) var uuid
  @Dependency(\.postFetcher) var postFetcher

  var body: some Feature {
    Update { state, action in
      switch action {
      case let .receivePosts(posts):
        state.children = IdentifiedArray(
          uniqueElements: posts.map { post in
            Child.State(id: uuid(), post: post)
          }
        )

      case .child:
        break
      }
    }
    .forEach(\.children, action: \.child) {
      Child()
    }
    .onMount { _ in
      store.addTask(id: store.loadingChildren, name: "Loading Posts") {
        let posts = try await postFetcher.fetch()
        try store.send(.receivePosts(posts))
      }
    }
  }
}

