unless ARGV.first
    puts "Usage"
    puts "openrepos path/to/file"
    puts ""
    puts "Ensure file contains newline separated URLs to repositories"
    exit
end

path = File.join(Dir.pwd, ARGV.first)

unless Dir.exist? path
    puts "Directory not found"
    exit
end



repos = Dir[path+"/*"]

repos.each do |repo|
    if File.directory? repo
        Dir.chdir(repo)
        puts Dir.pwd
        `git pull origin main`
        Dir.chdir("..")
    end
end