namespace :import_accounts do
  task :create_accounts => :environment do

require 'rubyXL'

workbook = RubyXL::Parser.parse("./finance.xlsx")
sheet_accounts = workbook["AccountData"]

first = true
puts "first: ", first
sheet_accounts.each { |row|
	new_data = Account.new
	col_dateofrecord = true		#1
	col_checkingacct = false	#2
	col_escrowacct = false		#3
	col_helocacct = false		#4
	col_amexacct = false		#5
	col_capitaloneacct = false	#6

	col_escrowdebt = false		#7
	col_aonacct = false		#8
	col_ssbacct = false		#9
	col_home = false		#10
	col_loanacct = false		#11
	col_assets = false		#12
	col_debts = false		#13
	col_networth = false		#14
	col_change = false		#15
	col_investments = false		#16

	row && row.cells.each { |cell|
		#puts cell.value
		if first == true && cell.value == "investments" 
			first = false
		elsif col_dateofrecord == true && first == false 
			new_data.dateofrecord = cell && cell.value
			#puts new_data.dateofrecord			
			col_dateofrecord = false
			col_checkingacct = true
		elsif col_checkingacct == true && first == false
			new_data.checkingacct = cell && cell.value
			#puts new_data.checkingacct			
			col_checkingacct = false
			col_escrowacct = true
		elsif col_escrowacct == true && first == false
			new_data.escrowacct = cell && cell.value
			#puts new_data.escrowacct			
			col_escrowacct = false
			col_helocacct = true
		elsif col_helocacct == true && first == false
			new_data.helocacct = cell && cell.value
			#puts new_data.helocacct			
			col_helocacct = false
			col_amexacct = true
		elsif col_amexacct == true && first == false
			new_data.amexacct = cell && cell.value
			#puts new_data.amexacct			
			col_amexacct = false
			col_capitaloneacct = true
		elsif col_capitaloneacct == true && first == false
			new_data.capitaloneacct = cell && cell.value
			#puts new_data.capitaloneacct			
			col_capitaloneacct = false
			col_escrowdebt = true
		elsif col_escrowdebt == true && first == false
			new_data.escrowdebt = cell && cell.value
			#puts new_data.escrowdebt			
			col_escrowdebt = false
			col_aonacct = true
		elsif col_aonacct == true && first == false
			new_data.aonacct = cell && cell.value
			#puts new_data.aonacct			
			col_aonacct = false
			col_ssbacct = true
		elsif col_ssbacct == true && first == false
			new_data.ssbacct = cell && cell.value
			#puts new_data.ssbacct			
			col_ssbacct = false
			col_home = true
		elsif col_home == true && first == false
			new_data.home = cell && cell.value
			#puts new_data.home			
			col_home = false
			col_loanacct = true
		elsif col_loanacct == true && first == false
			new_data.loanacct = cell && cell.value
			#puts new_data.loanacct			
			col_loanacct = false
			col_assets = true
		elsif col_assets == true && first == false
			new_data.assets = cell && cell.value
			#puts new_data.assets			
			col_assets = false
			col_debts = true
		elsif col_debts == true && first == false
			new_data.debts = cell && cell.value
			#puts new_data.debts			
			col_debts = false
			col_networth = true
		elsif col_networth == true && first == false
			new_data.networth = cell && cell.value
			#puts new_data.networth			
			col_networth = false
			col_change = true
		elsif col_change == true && first == false
			new_data.change = cell && cell.value
			#puts new_data.change			
			col_change = false
			col_investments = true
		elsif col_investments == true && first == false
			new_data.investments = cell && cell.value
			#puts new_data.investments			
			new_data.save
		end
	}
}

end
end

