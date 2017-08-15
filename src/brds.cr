require "yaml"
require "./lib/*"
require "file_utils"

#dirs = Crawler.new("./").crawl
#saver = Saver.new(dirs, "./backup.yaml").save
loaded_dirs = Loader.new("./backup.yaml").load

deployer = Deployer.new(loaded_dirs, "./backup.yaml", "./").deploy
