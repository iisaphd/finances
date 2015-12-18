namespace :import_savings do
  task :create_savings => :environment do

require 'rubyXL'

workbook = RubyXL::Parser.parse("./finance.xlsx")
sheet_savings = workbook["Savings"]

first = true
#puts "first: ", first
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
		#puts cell.value
		if first == true && cell.value == "totalvalue" 
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
			col_yeartodate = true
		elsif col_yeartodate == true && first == false
			new_data.yeartodate = cell && cell.value
			col_yeartodate = false
			col_totalsavings = true
		elsif col_totalsavings == true && first == false
			new_data.totalsavings = cell && cell.value
			col_totalsavings = false
			col_valueatretirement = true
		elsif col_valueatretirement == true && first == false
			new_data.valueatretirement = cell && cell.value
			col_valueatretirement = false
			col_totalvalue = true
		elsif col_totalvalue == true && first == false
			new_data.totalvalue = cell && cell.value
			col_totalvalue = false

			#puts "This row: ", new_data.totalvalue
			new_data.save
		end
	}
}

end
end

