class Deployer

  def initialize(dirs : Array(YAML::Any), path_from : String)
    @dirs = dirs
    @path_from = path_from
  end

  def deploy
    @dirs.each do |dir|
      path = File.join(@path_from, dir["path"].to_s)
      mode = dir["mode"].to_s.to_i
      atime = Time.parse(dir["atime"].to_s, "%FT%X%z")
      mtime = Time.parse(dir["mtime"].to_s, "%FT%X%z")
      begin
        Dir.mkdir_p(path, mode)
        File.utime(atime, mtime, path)
      rescue e
        puts e.message
      end
    end
  end

end
