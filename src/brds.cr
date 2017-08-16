require "./brds/*"
require "yaml"
require "file_utils"
require "admiral"

class Brds < Admiral::Command

  define_version "0.1.0"
  define_help description: "Backup and recovery directories structure"
  define_flag mode : String, description: "Work mode (backup | recovery)", long: list, short: m, required: true
  define_flag file : String, description: "Backup file or recovery source file", long: file, short: f, default: "backup.yaml"
  define_flag target : String, description: "Path to directory where will start backup or recovery process", long: target, short: t, default: "./"

  def run
    if flags.mode == "backup"
      dirs = Crawler.new(flags.target).crawl
      saver = Saver.new(dirs, flags.file).save
    elsif flags.mode == "recovery"
      loaded_dirs = Loader.new(flags.file).load
      deployer = Deployer.new(loaded_dirs, flags.target).deploy
    end
  end

end

Brds.run
