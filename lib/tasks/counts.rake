namespace :count do
  desc 'Counts the number of ruby-files in the project'
  task project_files: :environment do
    puts Dir.glob('./**/*.rb').length
  end
end

namespace :count do
  desc 'Counts the number of ruby-file strings in the project'
  task project_strings: :environment do
    strings = 0
    Dir.glob('./**/*.rb').each do |file|
      File.readlines(file).each { strings += 1 }
    end
    puts strings
  end
end