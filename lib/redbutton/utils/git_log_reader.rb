require 'git'

module RedButton
  module Utils
    class GitLogReader

      LOG_LIMIT = 1000

      def initialize(git_project_path, config)
        @repository = Git.open(git_project_path)
        @matchers = config[:matchers]
        @last_message_matcher = config[:last_message_matcher]
      end

      def read
        previous_tag_commit = @repository.log(LOG_LIMIT).grep(@last_message_matcher).first

        log_range = @repository.log(LOG_LIMIT).between(previous_tag_commit.sha, 'HEAD')
        result = @matchers.inject({}) do |result, (name, string_matcher)|
          result[name] ||= []
          result[name].concat(log_range.grep(string_matcher).map(&:message))
          result
        end

        result
      end
    end
  end
end
