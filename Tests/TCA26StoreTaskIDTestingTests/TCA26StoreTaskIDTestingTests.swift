import ComposableArchitecture
import Foundation
import Testing
@testable import TCA26StoreTaskIDTesting

@MainActor @Test
func parentChildOnMount() async {
  let store = withDependencies {
    $0.uuid = .incrementing
    $0.postFetcher = .liveValue
  } operation: {
    TestStore(initialState: Parent.State()) {
      Parent()
    }
  }

  await store.receive(\.receivePosts) {
    $0.children = [
      Child.State(
        id: UUID(0),
        post: Post(author: "Rhys", text: "Hello, World")
      )
    ]
  }
}
