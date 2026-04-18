//
//  PostFetcher.swift
//  TCA26StoreTaskIDTesting
//
//  Created by Rhys Morgan on 18/04/2026.
//

import Dependencies
import DependenciesMacros

struct Post {
  let author: String
  let text: String
}

@DependencyClient
struct PostFetcher: Sendable {
  var fetch: nonisolated(nonsending) @Sendable () async throws -> [Post]
}

extension PostFetcher: DependencyKey {
  static var testValue: PostFetcher {
    PostFetcher()
  }

  static var liveValue: PostFetcher {
    PostFetcher {
      [
        Post(author: "Rhys", text: "Hello, World")
      ]
    }
  }
}

extension DependencyValues {
  var postFetcher: PostFetcher {
    get { self[PostFetcher.self] }
    set { self[PostFetcher.self] = newValue }
  }
}
