# Prosper Loan Analysis
### James Malcolm

# Load Packages needed
library(ggplot2)
library(beeswarm)

# Load in Data

loans <- read.csv('./data/prosperLoanData.csv')

ggplot(aes(x=LoanOriginalAmount), data=loans) + 
  geom_histogram() +
  xlab('Original Loan Amount (USD)') +
  ggtitle('Histogram of original loan amount')

"""
From this, we can see that there are loan amounts well and above $30,000USD. A 
method to assess wehether these are valid loans or not would be see the reason
as to why they're getting the loan! Since however, we don't have have the
reason, we're going to continue doing more EDA on it.

Further research finds that the maximum loan amount in the dataset is $35,000.
This is pleasing as Prosper only allows loans ranging from $2,000 to $35,000.
Given we have no datapoints beyond $35,000, I'm confident enough that these
'outliers' are legitamate loans - so I won't remove or otherwise transform them.

The following boxplots explore the relationship of loan amounts across the
three different terms (12 months, 36 months and 60 months).
"""

loans$Term <- factor(loans$Term,
                    levels=c(12,36,60),
                    ordered=TRUE)

ggplot(aes(x=Term, y=LoanOriginalAmount), data=loans) +
  geom_boxplot() +
  xlab('Term (Months)') +
  ylab('Original Loan Amount (USD)') +
  ggtitle('Loan Amounts Across Terms')

max(loans$LoanOriginalAmount)

"""
Naturally, we would expect a longer term for the more money borrowed.
"""

