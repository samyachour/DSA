/*
 There are two sorted arrays nums1 and nums2 of size m and n respectively.
 
 Find the median of the two sorted arrays. The overall run time complexity should be O(log (m+n)).
 
 You may assume nums1 and nums2 cannot be both empty.
 
 Example 1:
 
 nums1 = [1, 3]
 nums2 = [2]
 
 The median is 2.0
 */

class SolutionMedian2Sorted {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        
        let totalLength = nums1.count + nums2.count
        var i = 0
        var j = 0
        
        var prev = 0
        var prevprev = 0
        
        for _ in 0...(totalLength/2) {
            
            if i < nums1.count && j < nums2.count {
                if nums1[i] < nums2[j] {
                    prevprev = prev
                    prev = nums1[i]
                    i += 1
                } else {
                    prevprev = prev
                    prev = nums2[j]
                    j += 1
                }
            }
            else if i >= nums1.count {
                prevprev = prev
                prev = nums2[j]
                j += 1
            } else {
                prevprev = prev
                prev = nums1[i]
                i += 1
            }
            
        }
        
        if totalLength % 2 == 1 {
            return Double(prev)
        } else {
            return Double(prev + prevprev) / 2.0
        }
        
    }
}
