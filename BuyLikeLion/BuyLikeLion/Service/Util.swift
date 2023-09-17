//
//  FirebaseUtil.swift
//  BuyLikeLion
//
//  Created by 박형환 on 2023/09/18.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

public typealias DocumentRefID = String

public typealias APIQuery = API.APIQuery


extension Encodable {
    
    ///nil 인 필드 제외하고 생성
    func toDictionaryNotNil() -> [String: Any] {
        let mirror = Mirror(reflecting: self)
        var dictionary = [String: Any]()
        
        for (label, value) in mirror.children {
            if let label {
                if let _ = value as? DocumentID<String> {   //=> @DocumentID 프로퍼티래퍼 사용할때 필터해주기위해 사용했던 구문.
                    
                } else if !(Mirror(reflecting: value).displayStyle == .optional && Mirror(reflecting: value).children.isEmpty) {
                    dictionary[label] = value
                }
            }
        }
        return dictionary
    }
    
}


public extension Firestore {
    func documentBuild(_ document: DocumentRefID) -> DocumentReference {
        self.document(document)
    }
    
    func collection(_ collection: Path) -> CollectionReference {
        self.collection(collection.path)
    }
}

public extension CollectionReference {
    
    func documentBuild(_ document: DocumentRefID?, collection: Path?) -> CollectionReference {
        if let document, let collection {
            return self.document(document).collection(collection.path)
        } else {
            return self
        }
    }
}

public extension CollectionReference {
    func queryBuild(query type: APIQuery<Any>?) -> Query {
        if let type {
            return type.queryBuild(query: self)
        } else {
            return self
        }
    }
}

extension Query {
    func pagination(document snapShot: DocumentSnapshot?) -> Query {
        if let snapShot {
            return self.start(afterDocument: snapShot)
        } else {
            return self
        }
    }
}

