/*
 -ith element is the price of the stock on day i
 -can buy/sell as many times as you want
 
 -if there's an increase, when it goes back down on the next element - sell
 -buy directly after a sell only if there's an increase
 -
 
 Input: [7,1,5,3,6,4]
 Output: 7
 Explanation: Buy on day 2 (price = 1) and sell on day 3 (price = 5), profit = 5-1 = 4.
 Then buy on day 4 (price = 3) and sell on day 5 (price = 6), profit = 6-3 = 3.
 
 */


class SolutionStocks2 {
    
    func maxProfit(_ prices: [Int]) -> Int {
        var maxprofit = 0
        
        for (idx, _) in prices.enumerated() {
            if idx == 0 { continue } // Skip first iteration
            
            if prices[idx] > prices[idx - 1] {
                maxprofit += prices[idx] - prices[idx - 1]
            }
        }
        
        return maxprofit
    }
    
    func maxProfitBad(_ prices: [Int]) -> Int {
        
        var profitTotal = 0
        var start = 0
        let length = prices.count - 1
        
        for (idx, price) in prices.enumerated() where idx >= start {
            
            if idx == length {
                break
            }
            
            let buffer = idx + 1
            
            for (subIdx, nextPrice) in prices[buffer...].enumerated() {
                
                let priceAfterNext = buffer + subIdx + 1
                let localProfit = nextPrice - price
                
                if buffer + subIdx == length {
                    if localProfit > 0 {
                        profitTotal += localProfit
                        start = buffer + subIdx
                    }
                    break
                } else if nextPrice > prices[priceAfterNext] && localProfit > 0 {
                    profitTotal += localProfit
                    start = priceAfterNext
                    break
                }
                
            }
            
        }
        
        return profitTotal
    }
    
}
