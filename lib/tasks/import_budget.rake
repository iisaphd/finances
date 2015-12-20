

namespace :import_budget do
  task :create_budget => :environment do
	require 'rubyXL'

	Budget.delete_all

	workbook = RubyXL::Parser.parse("./finance.xlsx")
	sheet_budget = workbook["Analysis"] 

	##### 2015 #####
	om_row = 3	# 0 based, modify this based on the particular spreadsheet "row 5 = 4"
	om_column = 1	# 0 based, modify this based on the particular spreadsheet "column h = 7"
	
	# read the data from the established cells
	# rails g model 
	# budget year:integer 
	# taxes:float 
	# investment401k:float 
	# investmentespp:float 
	# healthinsurance:float 
	# expenses:float 
	# housing:float 
	# remaining:float 
	# bonus:float

	om_taxes = 		sheet_budget[om_row][om_column].value
	om_401k = 		sheet_budget[om_row + 1][om_column].value
	om_espp = 		sheet_budget[om_row + 2][om_column].value
	om_insurance = 		sheet_budget[om_row + 3][om_column].value
	om_expenses = 		sheet_budget[om_row + 4][om_column].value
	om_housing = 		sheet_budget[om_row + 5][om_column].value
	om_bonus = 		sheet_budget[om_row + 6][om_column].value

	# store a new record in the database for 2015
	newbudgetdata = Budget.new
	newbudgetdata.year = 		"2015"
	newbudgetdata.taxes 	= 	om_taxes
	newbudgetdata.investment401k = 	om_401k
	newbudgetdata.investmentespp = 	om_espp
	newbudgetdata.healthinsurance= 	om_insurance
	newbudgetdata.expenses = 	om_expenses
	newbudgetdata.housing = 	om_housing
	newbudgetdata.remaining = 	0
	newbudgetdata.bonus = 		om_bonus
	newbudgetdata.save


	##### 2016 #####
	om_row = 3	# 0 based, modify this based on the particular spreadsheet "row 5 = 4"
	om_column = 5	# 0 based, modify this based on the particular spreadsheet "column h = 7"

	om_taxes = 		sheet_budget[om_row][om_column].value
	om_401k = 		sheet_budget[om_row + 1][om_column].value
	om_espp = 		sheet_budget[om_row + 2][om_column].value
	om_insurance = 		sheet_budget[om_row + 3][om_column].value
	om_expenses = 		sheet_budget[om_row + 4][om_column].value
	om_remaining = 		sheet_budget[om_row + 5][om_column].value
	om_bonus = 		sheet_budget[om_row + 6][om_column].value

	newbudgetdata = Budget.new
	newbudgetdata.year = 		"2016"
	newbudgetdata.taxes 	= 	om_taxes
	newbudgetdata.investment401k = 	om_401k
	newbudgetdata.investmentespp = 	om_espp
	newbudgetdata.healthinsurance= 	om_insurance
	newbudgetdata.expenses = 	om_expenses
	newbudgetdata.housing = 	0
	newbudgetdata.remaining = 	om_remaining
	newbudgetdata.bonus = 		om_bonus
	newbudgetdata.save

	##### 2017 #####
	om_row = 3	# 0 based, modify this based on the particular spreadsheet "row 5 = 4"
	om_column = 9	# 0 based, modify this based on the particular spreadsheet "column h = 7"

	om_taxes = 		sheet_budget[om_row][om_column].value
	om_401k = 		sheet_budget[om_row + 1][om_column].value
	om_espp = 		sheet_budget[om_row + 2][om_column].value
	om_insurance = 		sheet_budget[om_row + 3][om_column].value
	om_expenses = 		sheet_budget[om_row + 4][om_column].value
	om_housing = 		sheet_budget[om_row + 5][om_column].value
	om_bonus = 		sheet_budget[om_row + 6][om_column].value

	newbudgetdata = Budget.new
	newbudgetdata.year = 		"2017"
	newbudgetdata.taxes 	= 	om_taxes
	newbudgetdata.investment401k = 	om_401k
	newbudgetdata.investmentespp = 	om_espp
	newbudgetdata.healthinsurance= 	om_insurance
	newbudgetdata.expenses = 	om_expenses
	newbudgetdata.housing = 	0
	newbudgetdata.remaining = 	om_remaining
	newbudgetdata.bonus = 		om_bonus
	newbudgetdata.save
	
  end
end 
