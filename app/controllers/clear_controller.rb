class ClearController < ApplicationController
  def delete
 	#Savings.delete_all
	#Debts.delete_all
	#Networth.delete_all
	Accounts.delete_all
  end
end
