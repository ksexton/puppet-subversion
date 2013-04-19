Facter.add("svn_repos") do
  setcode do
    repo_data = Dir.glob('/var/www/svn/*').select {|f| File.directory? f}
    repo_name = Array.new

    repo_data.each do |repo|
      repo_name.push(repo.split('/').last)
    end

    repo_name.join(':')


  end
end
