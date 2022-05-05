#!/usr/bin/ruby

require'fileutils'

file_path = File.expand_path('~/Desktop')
puts "What do you want your root directory name to be? (with no spaces)"
proj_name = gets.chomp.downcase
puts "What is your first function or class name? (no spaces)"
class_name = gets.chomp.downcase
FileUtils.mkdir("#{file_path}/#{proj_name}")
FileUtils.mkdir("#{file_path}/#{proj_name}/lib")
FileUtils.mkdir("#{file_path}/#{proj_name}/spec")
FileUtils.touch("#{file_path}/#{proj_name}/Gemfile")
FileUtils.touch("#{file_path}/#{proj_name}/lib/#{class_name}.rb")
FileUtils.touch("#{file_path}/#{proj_name}/spec/#{class_name}_spec.rb")

class_up = class_name.capitalize


File.open("#{file_path}/#{proj_name}/Gemfile", "w") {
  |f| f.write "source 'https://rubygems.org'\n\ngem 'pry'\ngem 'rspec'"}

File.open("#{file_path}/#{proj_name}/spec/#{class_name}_spec.rb", "w") {
  |f| f.write "require 'pry'\nrequire 'rspec'\nrequire '#{class_name}'"}

File.open("#{file_path}/#{proj_name}/lib/#{class_name}.rb", "w") {
  |f| f.write "class #{class_up}\nend"}