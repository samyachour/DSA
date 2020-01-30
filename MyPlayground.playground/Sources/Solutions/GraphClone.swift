/*
 Given the head of a graph, return a deep copy (clone) of the graph. Each node in the graph contains a label (int) and a list (List[UndirectedGraphNode]) of its neighbors. There is an edge between the given node and each of the nodes in its neighbors.
 
 
 OJ's undirected graph serialization (so you can understand error output):
 Nodes are labeled uniquely.
 
 We use # as a separator for each node, and , as a separator for node label and each neighbor of the node.
 
 
 As an example, consider the serialized graph {0,1,2#1,2#2,2}.
 
 The graph has a total of three nodes, and therefore contains three parts as separated by #.
 
 First node is labeled as 0. Connect node 0 to both nodes 1 and 2.
 Second node is labeled as 1. Connect node 1 to node 2.
 Third node is labeled as 2. Connect node 2 to node 2 (itself), thus forming a self-cycle.
 
 Solution was in python:
 
 # Definition for a undirected graph node
 # class UndirectedGraphNode:
 #     def __init__(self, x):
 #         self.label = x
 #         self.neighbors = []
 
 class Solution:
    def __init__(self):
        self.visited = {}
 
    def cloneGraph(self, node):
        if not node:
            return None
        if node.label in self.visited:
            return self.visited[node.label]
 
        clone = UndirectedGraphNode(node.label)
        self.visited[node.label] = clone
 
        for n in node.neighbors:
            clone.neighbors.append(self.cloneGraph(n))
        return clone
 */
