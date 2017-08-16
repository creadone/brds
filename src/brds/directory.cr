class Directory
  def initialize(path : String, start_dir : String)
    @path = path
    @start_dir = start_dir
  end

  def level
    directory_level = Array(String).new
    @path.split("/").each do |item|
      directory_level << item unless item.nil? || item.empty?
    end
    directory_level.size
  end

  def stat
    if File.exists?(File.join(@start_dir, @path))
      stat = File.stat(File.join(@start_dir, @path))
      {
        "mode" => stat.mode,
        "uid" => stat.uid,
        "perm" => stat.perm,
        "atime" => stat.atime,
        "mtime" => stat.mtime,
        "ctime" => stat.ctime
      }
    else
      puts "Directory not found: #{File.join(@start_dir, @path)}"; exit
    end
  end

  def name
    @path.split("/").last
  end

  def to_h
    stat.merge({ "path" => @path, "level" => level })
  end
end
