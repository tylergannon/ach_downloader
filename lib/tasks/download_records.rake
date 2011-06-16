require 'net/http'

namespace :download do
  task :fed_ach_dir => :environment do
    import_string = nil
    puts "Downloading directory"
    Net::HTTP.start("www.fededirectory.frb.org") { |http|
      response = http.get("/FedACHdir.txt")
      import_string = response.body
    }
    FedAch.import import_string
        
  end
end
