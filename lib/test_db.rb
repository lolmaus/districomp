# coding: utf-8
# «Магический комментарий», задающий кодировку содержимого.

require 'csv'

class TestDB

	def initialize(args_hash={})
		@file   = args_hash[:file]   || File.join(APP_ROOT, 'database.csv')
	end

	def get_value(value_number)
		CSV.foreach(@file) do |row|
			return row if row[0] = value_number
		end
	end

end
