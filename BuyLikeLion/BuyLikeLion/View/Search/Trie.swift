//
//  Trie.swift
//  BuyLikeLion
//
//  Created by yunjikim on 2023/09/17.
//

import Foundation

class TrieNode {
    var value: String
    var children: [String: TrieNode] = [:]
    var isFinal: Bool = false
    var data: String?
    
    init(value: String) {
        self.value = value
    }
    
    func add(value: String) {
        let newNode = TrieNode(value: value)
        children[value] = newNode
    }
}

class Trie {
    let root: TrieNode
    
    init(root: TrieNode) {
        self.root = TrieNode(value: "")
    }
    
    func insert(word: String) {
        var node = root
        let wordArray = word.map { String($0) }
        
        for index in 0..<wordArray.count {
            let word = wordArray[index]
            if !node.children.keys.contains(word) {
                node.add(value: word)
            }
            node = node.children[word]!
        }
        
        node.isFinal = true
        node.data = word
    }
    
    func searchPrefix(prefix: String) -> [String] {
        var node = root
        let wordArray = prefix.map { String($0) }
        
        for word in wordArray {
            if node.children.keys.contains(word) {
                node = node.children[word]!
            } else {
                return []
            }
        }
        
        // 남은 뒷 단어 검색
        func remainWord(node: TrieNode) -> [String] {
            let keys = node.children.keys.map { String($0) }
            var result: [String] = []
            
            if node.isFinal {
                result.append(node.data!)
            }
            
            for key in keys {
                result += remainWord(node: node.children[key]!)
            }
            
            return result
        }
        
        return remainWord(node: node).sorted()
    }
}
