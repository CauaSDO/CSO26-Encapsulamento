//Encapsulamento

class CreditCrad {
    let number: String
    let limit: Double
    private var invoiceValue: Double = 0
    
    let iof: Double = 6.38
    
    init(number: String, limit: Double) {
        self.number = number
        self.limit = limit
    }
    
    final func makePurchase(off value: Double, isInteernational: Bool) -> Bool {
        let debit = isInteernational ? value * (1 + iof/100) : value
        let finalValue = invoiceValue + debit
        if finalValue > limit {
            return false
        } else {
            invoiceValue = finalValue
            return true
        }
    }
    
    func getInvoice() -> Double {
        return invoiceValue
    }
}

let creditCard = CreditCrad(number: "1365-9876-6590-1837", limit: 5000)
creditCard.makePurchase(off: 1500, isInteernational: true)
print(creditCard.getInvoice())

//creditCard.invoiceValue = 0
//print(creditCard.invoiceValue)


class DebitCreditCard: CreditCrad {
    private var _balance: Double = 0
    
    var balance: Double {
        return _balance
    }
    
    func makeTransaction(of value: Double) {
        _balance += value
    }
    
}

let debitCreditCard = DebitCreditCard(number: "8908-5267-8734-0293", limit: 5000)
debitCreditCard.makeTransaction(of: 500)
debitCreditCard.makeTransaction(of: -100)
print(debitCreditCard.balance)

