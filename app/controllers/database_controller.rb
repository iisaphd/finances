class DatabaseController < ApplicationController
  def clear
	# Use the following code to delete and reload database data without restarting rails
 	Saving.delete_all
	%x[rake import_savings:create_savings]
 	Debt.delete_all
	%x[rake import_debt_payoff:create_payoffs]
	Networth.delete_all
	%x[rake import_networth:create_networth]
	Account.delete_all
	%x[rake import_accounts:create_accounts]
	Plan1.delete_all
	%x[rake import_plan1:create_plan1]
	Plan2.delete_all
	%x[rake import_plan2:create_plan2]
	Plan3.delete_all
	%x[rake import_plan3:create_plan3]
	Budget.delete_all
	%x[rake import_budgets:create_budgets]

  end
end
