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

threads = []

repos = File.readlines path
repos.each do |repo|
    threads << Thread.new {
        repo = repo.chomp.gsub(".git", "").chomp
        match = repo.match /https:\/\/github.com\/(.*)\/(.*)/
        account = match[1].chomp
        repo_name = match[2].chomp
        `git clone #{repo} #{account}-#{repo_name}`
    }
end

threads.each(&:join)