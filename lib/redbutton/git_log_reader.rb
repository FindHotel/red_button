require 'git'

class GitLogReader

  LOG_LIMIT = 1000

  def initialize(git_project_path, config)
    # config = {
    #   matchers: {
    #     bugfix: ['Bug', 'Fix']
    #   },
    #   last_message_matcher: 'Merge tag'
    # }

    @repository = Git.open(git_project_path)
    @matchers = config[:matchers]
    @last_message_matcher = config[:last_message_matcher]
    @source_branch = config[:source_branch]
  end

  def read
    current_branch = @repository.current_branch

    @repository.checkout(@source_branch)

    previous_tag_commit = @repository.log(LOG_LIMIT).grep(@last_message_matcher).first

    log_range = @repository.log(LOG_LIMIT).between(previous_tag_commit.sha, 'HEAD')
    result = @matchers.inject({}) do |result, (name, string_matchers)|
      result[name] = string_matchers.inject([]) do |accumulator, string_matcher|
        accumulator.concat(log_range.grep(string_matcher).map(&:message))
        accumulator
      end

      result
    end

    @repository.checkout(current_branch)

    result
  end

end