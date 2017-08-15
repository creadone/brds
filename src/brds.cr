require "yaml"
require "./lib/*"

dirs = Crawler.new("./").crawl
saver = Saver.new(dirs, "./backup.yaml").save
loaded_dirs = Loader.new("./backup.yaml").load

loaded_dirs.each do |d|
  puts sprintf("%o", 493)
end
