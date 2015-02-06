class ProjectVersion

  def initialize(major, minor, patch)
    @major, @minor, @patch = major, minor, patch
  end

  def bump!(segment = 'patch')
    if segment == 'patch'
      @patch += 1
    elsif segment == 'minor'
      @minor += 1
      @patch = 0
    else
      @major += 1
      @minor = 0
      @patch = 0
    end
  end

  def to_s
    [@major, @minor, @patch].join('.')
  end

end