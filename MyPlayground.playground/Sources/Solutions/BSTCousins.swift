
/*
 In a binary tree, the root node is at depth 0, and children of each depth k node are at depth k+1.

 Two nodes of a binary tree are cousins if they have the same depth, but have different parents.

 We are given the root of a binary tree with unique values, and the values x and y of two different nodes in the tree.

 Return true if and only if the nodes corresponding to the values x and y are cousins.
 */


class SolutionCousins {
    private var parents = [Int: Int]()
    private var depths = [Int: Int]()

    func depthFirstSearch(child: TreeNode?, parent: TreeNode) {
        guard let child = child else { return }

        depths[child.val] = (depths[parent.val] ?? 0) + 1
        parents[child.val] = parent.val

        depthFirstSearch(child: child.left, parent: child)
        depthFirstSearch(child: child.right, parent: child)

    }
    func areCousins(_ root: TreeNode?, _ x: Int, _ y: Int) -> Bool {
        guard let root = root else { return false }

        depths[root.val] = 0
        depthFirstSearch(child: root.left, parent: root)
        depthFirstSearch(child: root.right, parent: root)

        return depths[x] == depths[y] && parents[x] != parents[y]
    }
}
