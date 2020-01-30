/*
 You are climbing a stair case. It takes n steps to reach to the top.
 
 Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?
 
 Note: Given n will be a positive integer.
 
 Input: 2
 Output: 2
 Explanation: There are two ways to climb to the top.
 1. 1 step + 1 step
 2. 2 steps
 
 Input: 3
 Output: 3
 Explanation: There are three ways to climb to the top.
 1. 1 step + 1 step + 1 step
 2. 1 step + 2 steps
 3. 2 steps + 1 step
 
 Input: 4
 Output: 5
 Explanation: There are five ways to climb to the top.
 1. 1 step + 1 step + 1 step + 1 step
 2. 1 step + 1 step + 2 steps
 3. 1 step + 2 steps + 1 step
 4. 2 steps + 1 step + 1 step
 5. 2 steps + 2 steps
 
 Input: 5
 Output: 8
 Explanation: There are  ways to climb to the top.
 1. 1 step + 1 step + 1 step + 1 step + 1 step
 2. 1 step + 1 step + 1 step + 2 steps
 3. 1 step + 1 step + 2 steps + 1 step
 4. 1 step + 2 steps + 1 step + 1 step
 5. 2 steps + 1 step + 1 step + 1 step
 6. 1 step + 2 steps + 2 steps
 7. 2 steps + 1 step + 2 steps
 8. 2 steps + 2 steps + 1 step
 */


class SolutionStairs {

    func climbStairs(_ n: Int) -> Int {
        
        if n == 1 { return 1 }

        var dp = [0,1,2]
        
        for i in 3...n {
            dp.append( dp[i - 1] + dp[i - 2] )
        }
        return dp[n]
    }

}

