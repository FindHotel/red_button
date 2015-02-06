class VersionFileTools

  FORMAT = /VERSION\s?=\s?'(?<major>\d+)\.(?<minor>\d+)\.(?<patch>\d+)'/

  def initialize(version_file_path)
    @version = ProjectVersion.new(*parse_version(version_file_path))
  end

  def update
    File.open(version_file, 'w') do |f|
      f.write("VERSION = '#{@version}'")
    end

  end

  private
  def parse_version(version_file)
    version_line = File.open(version_file, &:readline)

    [version_line[FORMAT, 'major'].to_i, version_line[FORMAT, 'minor'].to_i, version_line[FORMAT, 'patch'].to_i]
  end

end