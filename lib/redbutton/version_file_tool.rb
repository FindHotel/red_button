class VersionFileTool

  VERSION_FORMAT = /VERSION\s?=\s?'(?<major>\d+)\.(?<minor>\d+)\.(?<patch>\d+)'/

  def initialize(version_file_path)
    @version_file_path = version_file_path
  end

  def update_version(version)
    File.open(@version_file_path, 'w') do |f|
      f.write("VERSION = '#{version}'")
    end

  end

  def parse_version
    version_line = ''
    File.open(@version_file_path) do |f|
      version_line = f.readline
    end

    p 'som'

    {
      major: version_line[VERSION_FORMAT, 'major'].to_i,
      minor: version_line[VERSION_FORMAT, 'minor'].to_i,
      patch: version_line[VERSION_FORMAT, 'patch'].to_i
    }
  end
end