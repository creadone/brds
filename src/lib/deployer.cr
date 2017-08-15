class Deployer

  def initialize(dirs : Array(YAML::Any), backup_file : String, path_from : String)
    @dirs = dirs
    @backup_file = backup_file
    @path_from = path_from
  end

  def deploy
    @dirs.each do |dir|
      path = File.join(@path_from, dir["path"].to_s)
      mode = dir["mode"].to_s.to_i
      atime = Time.parse(dir["atime"].to_s, "%FT%X%z")
      mtime = Time.parse(dir["mtime"].to_s, "%FT%X%z")
      Dir.mkdir(path, mode)
      File.utime(atime, mtime, path)
    end
  end

end
