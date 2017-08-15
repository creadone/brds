class Directory

  def initialize(path : String)
    @path = path
  end

  def level
    directory_level = Array(String).new
    @path.split("/").each do |item|
      directory_level << item unless item.nil? || item.empty?
    end
    directory_level.size
  end

  def stat
    if File.exists?(@path)
      stat = File.stat(@path)
      {
        "mode" => sprintf("%o", stat.mode),
        "uid" => stat.uid,
        "perm" => stat.perm,
        "atime" => stat.atime,
        "mtime" => stat.mtime,
        "ctime" => stat.ctime
      }
    else
      raise "Directory not found: #{@path}"
    end
  end

  def name
    @path.split("/").last
  end

  def to_h
    stat.merge({ "path" => @path, "level" => level })
  end

end
