namespace :import_networth do
  task :create_networth => :environment do

require 'rubyXL'

workbook = RubyXL::Parser.parse("./finance.xlsx")
sheet_networth = workbook["NetWorthData"]

first = true
puts "first: ", first
sheet_networth.each { |row|
	new_data = Networth.new
	col_dateofrecord = true
	col_assets = false
	col_debts = false
	col_networth = false
	col_change = false
	col_changerate = false
	col_pctnw = false

	#col_escrowowed = false
	#col_loanfunds = false
	#col_loanremaining = false

	row && row.cells.each { |cell|
		#puts cell.value
		if first == true && cell.value == "changerate" 
			#puts "do nothing"
			first = false
		elsif col_dateofrecord == true && first == false 
			new_data.dateofrecord = cell && cell.value
			#puts new_data.dateofrecord			
			col_dateofrecord = false
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
			col_changerate = true
		elsif col_changerate == true && first == false
			new_data.changerate = cell && cell.value
			puts new_data.changerate			
			col_changerate = false
			col_pctnw = true
		elsif col_pctnw == true && first == false
			new_data.pctnw = cell && cell.value
			puts new_data.pctnw			
			new_data.save
		end
	}
}

end
end

