module RedButton
  module Utils
    class ReleaseNotesWriter

      FILE_EXTENSION = 'txt'

      def initialize(folder, version)
        @folder = folder
        @version = version
      end

      def write(content)

        subdir_name = "#{@version.major}.#{@version.minor}"
        out_dir_path = File.join(@folder, subdir_name)

        ensure_folder_exists(out_dir_path)

        file_out_path = File.join(out_dir_path, "#{@version.to_s}.#{FILE_EXTENSION}")

        File.open(file_out_path, 'w') do |file|
          file.write(content)
        end
      end

      private

      def ensure_folder_exists(path)
        dirname = File.dirname(path)
        FileUtils.mkdir_p(dirname) unless File.directory?(dirname)

      end
    end
  end
end
