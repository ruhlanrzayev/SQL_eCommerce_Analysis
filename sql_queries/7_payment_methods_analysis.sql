-- =============================================
-- Payment Methods Analysis --
-- Which payment methods are most used and what is the average installment count?
-- =============================================

-- Payment Methods -> Order_Payments

SELECT
    payment_type AS payment_methods,
    COUNT(*) AS total_count,
    ROUND(AVG(payment_installments), 2) AS avg_installment_count
FROM order_payments
GROUP BY payment_methods
ORDER BY total_count DESC


/*

Credit card dominates overwhelmingly with 76,795 uses (~74% of all payments) and is the only method with meaningful installments, 
averaging 3.51 — reflecting Brazil's strong cultural preference for paying in installments ("parcelado"). Boleto (a popular Brazilian bank slip) 
comes second at ~19K but is always paid in a single payment (1.00 installments), as are voucher and debit_card by nature. The 3 "not_defined" 
records are negligible noise. The takeaway: any payment or checkout optimization should focus heavily on the credit card installment experience 
since that's what the vast majority of customers use.

RESULT:

[
  {
    "payment_methods": "credit_card",
    "total_count": "76795",
    "avg_installment_count": "3.51"
  },
  {
    "payment_methods": "boleto",
    "total_count": "19784",
    "avg_installment_count": "1.00"
  },
  {
    "payment_methods": "voucher",
    "total_count": "5775",
    "avg_installment_count": "1.00"
  },
  {
    "payment_methods": "debit_card",
    "total_count": "1529",
    "avg_installment_count": "1.00"
  },
  {
    "payment_methods": "not_defined",
    "total_count": "3",
    "avg_installment_count": "1.00"
  }
]

*/