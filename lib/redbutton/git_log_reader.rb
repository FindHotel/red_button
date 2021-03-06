require 'git'

class GitLogReader

  LOG_LIMIT = 1000

  def initialize(git_project_path, config)
    @repository = Git.open(git_project_path)
    @matchers = config[:matchers]
    @last_message_matcher = config[:last_message_matcher]
  end

  def read
    # previous_tag_commit = @repository.log(LOG_LIMIT).grep(@last_message_matcher).first

    start_tag = @repository.tags.inject([]) do |obj, tag|
      obj << tag.name if tag.name[/\d+(\.\d+)+/]
      obj
    end.last

    log_range = @repository.log(LOG_LIMIT).between(start_tag, 'HEAD')
    result = @matchers.inject({}) do |obj, (name, string_matcher)|
      obj[name] ||= []
      obj[name].concat(log_range.grep(string_matcher).map(&:message))
      obj
    end

    result
  end

end
