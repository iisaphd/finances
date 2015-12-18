namespace :import_debt_payoff do
  task :create_payoffs => :environment do

require 'rubyXL'

workbook = RubyXL::Parser.parse("./finance.xlsx")
sheet_debt = workbook["DebtPayOffPlan"]

first = true
#puts "first: ", first
sheet_debt.each { |row|
	new_data = Debt.new
	col_transactiondate = true
	col_type = false
	col_amount = false
	col_heloc = false
	col_escrowdebt = false
	col_escrowremaining = false
	col_escrowowed = false
	col_loanfunds = false
	col_loanremaining = false

	row && row.cells.each { |cell|
		#puts cell.value
		if first == true && cell.value == "loanremaining" 
			#do nothing
			first = false
		elsif col_transactiondate == true && first == false 
			new_data.transactiondate = cell && cell.value
			#puts new_data.transactiondate			
			col_transactiondate = false
			col_type = true
		elsif col_type == true && first == false
			new_data.type = cell && cell.value
			#puts new_data.type			
			col_type = false
			col_amount = true
		elsif col_amount == true && first == false
			new_data.amount = cell && cell.value
			#puts new_data.amount			
			col_amount = false
			col_heloc = true
		elsif col_heloc == true && first == false
			new_data.heloc = cell && cell.value
			#puts new_data.heloc			
			col_heloc = false
			col_escrowdebt = true
		elsif col_escrowdebt == true && first == false
			new_data.escrowdebt = cell && cell.value
			#puts new_data.escrowdebt			
			col_escrowdebt = false
			col_escrowremaining = true
		elsif col_escrowremaining == true && first == false
			new_data.escrowremaining = cell && cell.value
			#puts new_data.escrowremaining			
			col_escrowremaining = false
			col_escrowowed = true
		elsif col_escrowowed == true && first == false
			new_data.escrowowed = cell && cell.value
			#puts new_data.escrowowed
			col_escrowowed = false
			col_loanfunds = true
		elsif col_loanfunds == true && first == false
			new_data.loanfunds = cell && cell.value
			puts new_data.loanfunds
			col_loanfunds = false
			col_loanremaining = true
		elsif col_loanremaining == true && first == false
			new_data.loanremaining = cell && cell.value
			puts "This row: ", new_data.loanremaining
			new_data.save
		end
	}
}

end
end

