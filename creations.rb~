require 'rubyXL'

workbook = RubyXL::Parser.parse("./IAM\ Report_All.xlsx")
sheet_creations = workbook[0]

first = true
puts "first: ", first
sheet_creations.each { |row|
	new_acct_data = Acct.new
	col_user_type = true
	col_creation_date = false
	col_columnc = false
	col_columnd = false

	row && row.cells.each { |cell|
		puts cell
		if first == true
			#do nothing
			first = false
		elsif col_user_type == true 
			#new-acct-data.user_type = cell && cell.value
			col_user_type = false
			col_creation_date = true
		elsif col_creation_date == true
			#new-acc-data.creation_date_time cell && cell.value
			col_creation_date = false
			col_columnc = true
		elsif col_columnc == true
			# not storing column c
			col_columnc = false
			col_columnd = true
		elsif col_columnd == true
			# not storing column d
			col_columnd = false
			puts "This row: ", new-acct-data
			#new-acct-data.save
		end
	}
}
