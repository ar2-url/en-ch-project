//
//  CaseStudyResponse.swift
//  EngineeringChallenge
//
//  Created by Artur on 02/06/21.
//

import Foundation

// MARK: - CaseStudyResponse
struct CaseStudyResponse: Codable {
    let caseStudies: [CaseStudy]

    enum CodingKeys: String, CodingKey {
        case caseStudies = "case_studies"
    }
}

// MARK: - CaseStudy
struct CaseStudy: Codable {
    let id: Int
    let client: String?
    let teaser, vertical: String
    let isEnterprise: Bool
    let title: String
    let heroImage: String
    let sections: [Section]
    let appStoreURL: String?

    enum CodingKeys: String, CodingKey {
        case id, client, teaser, vertical
        case isEnterprise = "is_enterprise"
        case title
        case heroImage = "hero_image"
        case sections
        case appStoreURL = "app_store_url"
    }
}

// MARK: - Section
struct Section: Codable {
    let title: String?
    let bodyElements: [BodyElementElement]

    enum CodingKeys: String, CodingKey {
        case title
        case bodyElements = "body_elements"
    }
}

enum BodyElementElement: Codable {
    case bodyElementClass(BodyElementClass)
    case string(String)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        if let x = try? container.decode(BodyElementClass.self) {
            self = .bodyElementClass(x)
            return
        }
        throw DecodingError.typeMismatch(BodyElementElement.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for BodyElementElement"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .bodyElementClass(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        }
    }
}

// MARK: - BodyElementClass
struct BodyElementClass: Codable {
    let imageURL: String

    enum CodingKeys: String, CodingKey {
        case imageURL = "image_url"
    }
}
//no comments

//for branch no4
