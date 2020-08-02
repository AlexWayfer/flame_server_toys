# frozen_string_literal: true

require 'English'
require 'fileutils'

module FlameServerToys
	class Template
		## Class for pids files
		class PidsFile
			class << self
				## It will be set in the Base template from received config
				attr_accessor :pids_dir
			end

			def initialize(name, *pids)
				@file = File.join self.class.pids_dir, "#{name}.pids"
				@pids = pids.any? ? pids : read
			end

			def dump(pids = @pids)
				FileUtils.mkdir_p self.class.pids_dir
				puts "PidsFile dump : #{pids} => #{@file}"
				File.write @file, pids.join($RS)
			end

			def read
				return unless File.exist?(@file)

				@pids = File.read(@file).split($RS).map(&:to_i)
				puts "PidsFile read : #{@pids}"
				@pids
			end

			def kill_each(pids = @pids)
				Array(pids).each do |pid|
					puts "PidsFile kill : #{pid}"
					Process.kill('TERM', -Process.getpgid(pid))
				rescue Errno::ESRCH
					puts "Process #{pid} doesn't exist"
				end
				self
			end

			def delete
				return unless File.exist?(@file)

				File.delete @file
			end
		end

		private_constant :PidsFile
	end
end
