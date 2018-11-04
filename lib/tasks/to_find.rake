require_relative 'search'

desc 'Выводит количество ruby файлов в заданной директории и количество строк в них'
task :search, [:path] do |_t, args|
  if !args.has_key? :path
    puts 'Задайте директорию для поиска. Например: rake \'search[..]\''
    next
  end
  path = File.expand_path args.path
  if !Dir.exist? path
    puts "Директория не найдена: #{args.path}"
    next
  end
  puts 'файлов с расширением .rb:'
  how_many_files   = ->(path, quantity){ puts "файлов: #{quantity} в \t #{path}" }
  how_many_strings = ->(path, quantity){ puts "строк : #{quantity} в \t #{path}" }
  total = Search::files  /.*\.rb/, path, how_many_files, how_many_strings 
  puts "Итого, #{total} файлов с расширением .rb"
end

task :default => :search
