
require 'find'

if ARGV.empty?
  puts "Insert the directory path as an argument"
  exit 1
end

directory = ARGV[0]

unless File.directory?(directory)
  puts "The directory '#{directory}' doesn't exist"
  exit 1
end

def list_directories(directory)
  Find.find(directory) do |path|
    if File.directory?(path)
      puts path
    end
  end
end

list_directories(directory)