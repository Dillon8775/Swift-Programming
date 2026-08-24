/*:
## Exercise: Lottery Tickets
 Your friend’s entrepreneurial spirit knows no bounds. Now your friend is running the town lottery.
 
 By naming things and only setting a value once, it's easier to figure out the correct way of calculating something. Later, you can change the values and check the answers.
 */
// Values you should edit
let ticketsSold = 2000
let ticketPrice = 5
let printingCosts = 25
let advertising = 65
/*:
 - callout(Exercise): You’ve done enough work for free for your friend. In return for your help on this venture, your friend will give you a tenth of the profits. The jackpot is half of the total ticket sales money. Try changing the numbers above - tickets sold, ticket price, printing costs, or advertising costs  - and see if you can get your cut up to 100 or more.

 The calculations below are fixed, but you can change the results by changing the numbers above:
 */
// Total takings
let totalTakings = ticketPrice * ticketsSold

// Jackpot
let jackpot = totalTakings / 2

// Expenses
let totalExpenses = printingCosts + advertising

// Profit
let profit = totalTakings - jackpot - totalExpenses

// Distribution
let programmersCut = profit / 10 // This is the answer you want to get > 100! 👉 
let friendsCut = profit - programmersCut

/*:
[Previous](@previous)  |  page 11 of 14  |  [Next: Exercise: What Fits on Your iPhone?](@next)
 */
