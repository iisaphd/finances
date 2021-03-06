namespace :import_plan1 do
  task :create_plan1 => :environment do

require 'rubyXL'

workbook = RubyXL::Parser.parse("./finance.xlsx")
sheet_plan1 = workbook["plan-1"]

first = true
puts "first: ", first
sheet_plan1.each { |row|
	new_data = Plan1.new
	col_age = true		#1
	col_assets = false	#2
	col_col = false		#3
	col_assets2 = false		#4
	col_rate = false		#5
	col_interest = false	#6

	col_ss = false		#7
	col_eoyvalue = false		#8
	col_change = false		#9

	row && row.cells.each { |cell|
		#puts cell.value
		if first == true && cell.value == "change" 
			first = false
		elsif col_age == true && first == false 
			new_data.age = cell && cell.value
			#puts new_data.age			
			col_age = false
			col_assets = true
		elsif col_assets == true && first == false
			new_data.assets = cell && cell.value
			#puts new_data.assets			
			col_assets = false
			col_col = true
		elsif col_col == true && first == false
			new_data.col = cell && cell.value
			#puts new_data.col			
			col_col = false
			col_assets2 = true
		elsif col_assets2 == true && first == false
			new_data.assets2 = cell && cell.value
			#puts new_data.assets2			
			col_assets2 = false
			col_rate = true
		elsif col_rate == true && first == false
			new_data.rate = cell && cell.value
			#puts new_data.rate			
			col_rate = false
			col_interest = true
		elsif col_interest == true && first == false
			new_data.interest = cell && cell.value
			#puts new_data.interest			
			col_interest = false
			col_ss = true
		elsif col_ss == true && first == false
			new_data.ss = cell && cell.value
			#puts new_data.ss			
			col_ss = false
			col_eoyvalue = true
		elsif col_eoyvalue == true && first == false
			new_data.eoyvalue = cell && cell.value
			#puts new_data.eoyvalue			
			col_eoyvalue = false
			col_change = true
		elsif col_change == true && first == false
			new_data.change = cell && cell.value
			#puts new_data.change
			new_data.save
		end
	}
}

end
end

