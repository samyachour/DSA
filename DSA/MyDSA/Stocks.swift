/*
 -ith element is the price of the stock on day i
 -only can buy/sell one share of stock, maximize profit
 -find the maximum delta between values in the ordered direction
 */

class SolutionStocks {
    
    func maxProfit(_ prices: [Int]) -> Int {
        var minprice = Int.max
        var maxprofit = 0
        
        for (idx, _) in prices.enumerated() {
            if prices[idx] < minprice {
                minprice = prices[idx]
            } else if (prices[idx] - minprice) > maxprofit {
                maxprofit = prices[idx] - minprice
            }
        }
        
        return maxprofit
    }
    
    func maxProfitBad(_ prices: [Int]) -> Int {
        
        if prices == [] {
            return 0
        }
        
        var profit = 0
        
        for (idx,price) in prices.enumerated() {
            
            let starter = price
            
            if idx + 1 == prices.count {
                break
            } else if prices[idx + 1] < price {
                continue
            }
            
            for subPrice in prices[(idx+1)...] {
                
                let tempProfit = subPrice - starter
                
                if tempProfit > profit {
                    profit = tempProfit
                }
            }
            
        }
        
        return profit
        
    }
}

