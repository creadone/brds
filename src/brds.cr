require "yaml"
require "admiral"
require "file_utils"
require "./brds/*"

# dirs = Crawler.new("./").crawl
# saver = Saver.new(dirs, "./backup.yaml").save
loaded_dirs = Loader.new("./backup.yaml").load
deployer = Deployer.new(loaded_dirs, "./").deploy
