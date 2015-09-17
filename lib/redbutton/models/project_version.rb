module RedButton
  module Models
    class ProjectVersion
      attr_reader :major, :minor, :patch, :suffix

      def initialize(major, minor, patch, suffix = nil)
        @major, @minor, @patch, @suffix = major, minor, patch, suffix
      end

      def bump!(segment = 'patch')
	segment = 'patch' if segment == 'suffix' && @suffix.nil?

        if segment == 'suffix'
      	  md = @suffix.match(/^(beta|rc)([0-9])$/)
          @suffix = "#{md[1]}#{md[2].to_i + 1}"
        elsif segment == 'patch'
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
        s = [@major, @minor, @patch].join('.')
        s = [s, @suffix].join('.') if @suffix
        s
      end

    end
  end
end
