class FinanceController < ApplicationController
  def show
	@savings = Saving.select('DISTINCT transactiondate')
	@debts = Debt.all
	@networth = Networth.all
	@accounts = Account.all
	@plan1s = Plan1.all
	@plan2s = Plan2.all
	@plan3s = Plan3.all
	@budgets = Budget.all
  end
end
