//
//  Child.swift
//  TCA26StoreTaskIDTesting
//
//  Created by Rhys Morgan on 18/04/2026.
//

import ComposableArchitecture
import Foundation

@Feature
struct Child {
  struct State: Identifiable {
    let id: UUID
    let post: Post
  }

  enum Action {
    case didTapChild
  }

  var body: some Feature {
    Update { state, action in
      switch action {
      case .didTapChild:
        print(state.post)
      }
    }
  }
}
