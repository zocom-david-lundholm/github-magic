unless ARGV.first
    puts "Usage"
    puts "openrepos path/to/file"
    puts ""
    puts "Ensure file contains newline separated URLs to repositories"
    exit
end

path = File.join(Dir.pwd, ARGV.first)

unless File.exist? path
    puts "File not found"
    exit
end


repos = File.readlines path
repos.each do |repo|
    `open #{repo}`
end