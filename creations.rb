require 'rubyXL'

workbook = RubyXL::Parser.parse("./finance.xlsx")
sheet_savings = workbook["Savings"]

first = true
puts "first: ", first
sheet_savings.each { |row|
	new_data = Saving.new
	col_transactiondate = true
	col_type = false
	col_amount = false
	col_yeartodate = false
	col_totalsavings = false
	col_valueatretirement = false
	col_totalvalue = false


	row && row.cells.each { |cell|
		puts cell
		if first == true
			#do nothing
			first = false
		elsif col_transactiondate == true 
			#new-acct-data.user_type = cell && cell.value
			col_transactiondate = false
			col_type = true
		elsif col_type == true
			#new-acc-data.creation_date_time cell && cell.value
			col_type = false
			col_amout = true
		elsif col_amount == true
			#new-acc-data.creation_date_time cell && cell.value
			col_amount = false
			col_yeartodate = true
		elsif col_yeartodate == true
			#new-acc-data.creation_date_time cell && cell.value
			col_yeartodate = false
			col_totalsavings = true
		elsif col_totalsavings == true
			#new-acc-data.creation_date_time cell && cell.value
			col_totalsavings = false
			col_valueatretirement = true
	
		elsif col_valueatretirement == true
			#new-acc-data.creation_date_time cell && cell.value
			col_valueatretirement = false
			col_totalvalue = true
		elsif col_totalvalue == true
			#new-acc-data.creation_date_time cell && cell.value
			col_totalvalue = false
			col_transactiondate = true

			puts "This row: ", new-acct-data
			#new-acct-data.save
		end
	}
}
