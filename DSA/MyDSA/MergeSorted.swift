/*
Given two sorted integer arrays nums1 and nums2, merge nums2 into nums1 as one sorted array.

Note:

The number of elements initialized in nums1 and nums2 are m and n respectively.
You may assume that nums1 has enough space (size that is greater or equal to m + n) to hold additional elements from nums2.
*/

class SolutionMergeArrays {
	func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
		var lastPosition = nums1.count - 1
		var index1 = m - 1
		var index2 = n - 1
		while index2 >= 0 && lastPosition >= 0 {
			if index1 < 0 {
				nums1[lastPosition] = nums2[index2]
				index2 -= 1
				lastPosition -= 1
				continue
			}
			if nums2[index2] > nums1[index1] {
				nums1[lastPosition] = nums2[index2]
				lastPosition -= 1
				index2 -= 1
			} else {
				nums1[lastPosition] = nums1[index1]
				nums1[index1] = 0
				lastPosition -= 1
				index1 -= 1
			}
		}
	}
}
