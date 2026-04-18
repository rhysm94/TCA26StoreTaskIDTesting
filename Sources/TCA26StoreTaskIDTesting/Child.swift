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
    @StoreTaskID var pretendLoading

    let id: UUID
    let post: Post
  }

  @Dependency(\.continuousClock) var clock

  enum Action {
    case didTapChild
  }

  var body: some Feature {
    Update { state, action in
      switch action {
      case .didTapChild:
        store.addTask(id: state.pretendLoading) {
          try? await clock.sleep(for: .seconds(1))
          print("Just pretending!")
        }
      }
    }
  }
}
