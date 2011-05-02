# coding: utf-8
# «Магический комментарий», задающий кодировку содержимого.

require 'csv'

class PopulateDB

	def initialize(args_hash={})
		@file   = args_hash[:file]   || File.join(APP_ROOT, 'database.csv')
		@fields = args_hash[:fields] || [ :id, :random, :empty ]
		@amount = args_hash[:amount] || 1000
	end

	def populate!

		CSV.open(@file, "w") do |csv|

			@amount.times do |i|

				array = []
				@fields.each do |field|
					case field
						when :id then array << i
						when :random then array << rand(1000000)
						when :empty then array << ""
					end
				end

				csv << array

			end # times
		end # CSV.open
	end # populate!
end
