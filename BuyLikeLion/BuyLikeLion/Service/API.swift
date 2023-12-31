//
//  API.swift
//  BuyLikeLion
//
//  Created by 박형환 on 2023/09/18.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

public typealias Path = API.Path

public struct API {
    
    public enum Path: String {
        case user
        case post
        
        var path: String {
            return rawValue
        }
        
        var description: String {
            switch self {
            case .user:
                return "유저"
            case .post:
                return "게시물"
            default:
                return "something else"
            }
        }
    }
    
    public indirect enum APIQuery<FieldValue> {
        public typealias FieldType = String
        public typealias FieldValue = Any
        
        case inOnField(FieldType, [FieldValue])
        case notInField(FieldType, [FieldValue])
        case equal(FieldType, FieldValue)
        case lessThan(FieldType, FieldValue)
        case greaterThan(FieldType, FieldValue)
        case lessOrEqual(FieldType, FieldValue)
        case greaterOrEqual(FieldType, FieldValue)
        case notEqual(FieldType, FieldValue)
        case arrayContains(FieldType, FieldValue)
        
        case filter(APIQuery<FieldValue>)
        
        case and([APIQuery<FieldValue>])
        case or([APIQuery<FieldValue>])
        
        func queryBuild(query: CollectionReference) -> Query {
            switch self {
                
            case .inOnField(let type, let values):
                return query.whereField(type, in: values)
                
            case .notInField(let type, let values):
                return query.whereField(type, notIn: values)
                
            case .equal(let type, let value):
                return query.whereField(type, isEqualTo: value)
                
            case .lessThan(let type, let value):
                return query.whereField(type, isLessThan: value)
                
            case .greaterThan(let type, let value):
                return query.whereField(type, isGreaterThan: value)
                
            case .lessOrEqual(let type, let value):
                return query.whereField(type, isLessThanOrEqualTo: value)
                
            case .greaterOrEqual(let type, let value):
                return query.whereField(type, isGreaterThanOrEqualTo: value)
                
            case .notEqual(let type, let value):
                return query.whereField(type, isNotEqualTo: value)
                
            case .arrayContains(let type, let value):
                return query.whereField(type, arrayContains: value)
                
            case .filter(let queryType):
                return queryFilter(query: query, type: queryType)
                
            default:
                return query
            }
        }
        
        func queryFilter(query: CollectionReference, type: APIQuery) -> Query {
            let filter = type.buildFilter()
            return query.whereFilter(filter)
        }
        
        private func buildFilter() -> Filter {
            switch self {
            case .inOnField(let fieldType, let array):
                return .whereField(fieldType, in: array)
                
            case .notInField(let type, let values):
                return .whereField(type, notIn: values)
                
            case .equal(let type, let value):
                return .whereField(type, isEqualTo: value)
                
            case .lessThan(let type, let value):
                return .whereField(type, isLessThan: value)
                
            case .greaterThan(let type, let value):
                return .whereField(type, isGreaterThan: value)
                
            case .lessOrEqual(let type, let value):
                return .whereField(type, isLessThanOrEqualTo: value)
                
            case .greaterOrEqual(let type, let value):
                return .whereField(type, isGreaterOrEqualTo: value)
                
            case .notEqual(let type, let value):
                return .whereField(type, isNotEqualTo: value)
                
            case .arrayContains(let type, let value):
                return .whereField(type, arrayContains: value)
                
            case .and(let queries):
                let filters = queries.compactMap { $0.buildFilter() }
                return .andFilter(filters)
                
            case .or(let queries):
                let filters = queries.compactMap { $0.buildFilter() }
                return .orFilter(filters)
                
            case .filter( _ ):
                return .init()
            }
        }
        
    }
}

