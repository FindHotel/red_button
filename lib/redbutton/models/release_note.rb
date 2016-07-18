class ReleaseNote

  TYPES = {
    bugfix: 'BUGFIX',
    feature: 'FEATURE',
    change: 'CHANGE'
  }

  USEFUL_MESSAGE_LINE_INDEX = 1

  attr_accessor :type

  def initialize(type, raw_message)
    @type = type
    @pr_message = raw_message.split("\n\n")[USEFUL_MESSAGE_LINE_INDEX]
    @valid = @pr_message.nil? ? false : true
  end

  def message
    @clean_message ||= clean
  end

  def valid?
    @valid
  end

  def self.get_human_readable_type(type)
    {
      bugfix: 'Bug Fixes',
      feature: 'Features',
      change: 'Changes'
    }[type]
  end

  private
  def clean
    @pr_message.nil? ? @pr_message : @pr_message.gsub(/^#{TYPES[type]}:?\s?/, '')
  end
end
