import Foundation

struct User: Codable, Identifiable, Equatable {
    let login: String
    let id: Int
    let html_url: String
    let avatar_url: String

    let node_id: String
    let followers_url: String
    let subscriptions_url: String
    let organizations_url: String
    let repos_url: String
    let received_events_url: String
    let type: String
    let site_admin: Bool
}
