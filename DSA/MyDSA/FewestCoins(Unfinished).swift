/*
 You are given coins of different denominations and a total amount of money amount. Write a function to compute the fewest number of coins that you need to make up that amount. If that amount of money cannot be made up by any combination of the coins, return -1.
 
 Example 1:
 
 Input: coins = [1, 2, 5], amount = 11
 Output: 3
 Explanation: 11 = 5 + 5 + 1
 */

class SolutionChange {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        
        var sortedCoins = coins.sorted()
        var step = 1
        var index = sortedCoins.count - 1
        var givenAmount = amount
        var totalCoins = 0
        
        while givenAmount > 0 {
            if index < 0 {
                step += 1
                if step == sortedCoins.count { return -1 }
                sortedCoins.append(sortedCoins.remove(at: 0))
                
                index = sortedCoins.count - 1
                givenAmount = amount
                totalCoins = 0
            }
            let divisor = sortedCoins[index]
            if divisor <= givenAmount {
                totalCoins += givenAmount / divisor
                givenAmount = givenAmount % divisor
            }
            index -= 1
        }
        
        return totalCoins
        
    }
}
