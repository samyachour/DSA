/*
 Implement a prefix tree
 */

class TrieNode {
    var links = [Character : TrieNode]()
    var isCompleteWord = false
}

class Trie {
    
    var root : TrieNode
    
    /** Initialize your data structure here. */
    init() {
        self.root = TrieNode()
    }
    
    /** Inserts a word into the trie. */
    func insert(_ word: String) {
        var node = root
        
        for char in word {
            if let newNode = node.links[char] {
                node = newNode
            } else {
                node.links[char] = TrieNode()
                node = node.links[char]!
            }
        }
        node.isCompleteWord = true
    }
    
    /** Returns if the word is in the trie. */
    func search(_ word: String) -> Bool {
        var node = root
        
        for char in word {
            if let newNode = node.links[char] {
                node = newNode
            } else {
                return false
            }
        }
        
        return node.isCompleteWord
    }
    
    /** Returns if there is any word in the trie that starts with the given prefix. */
    func startsWith(_ prefix: String) -> Bool {
        var node = root
        
        for char in prefix {
            if let newNode = node.links[char] {
                node = newNode
            } else {
                return false
            }
        }
        
        return true
    }
}

/**
 * Your Trie object will be instantiated and called as such:
 * let obj = Trie()
 * obj.insert(word)
 * let ret_2: Bool = obj.search(word)
 * let ret_3: Bool = obj.startsWith(prefix)
 */
