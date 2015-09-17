require 'rspec'
require 'spec_helper'
require 'ostruct'

describe 'VersionFileTools' do

  let(:version_file_name) { 'version.rb' }
  let(:version_file_path) { "/fake/rails/root/#{version_file_name}" }

  let(:major) { 1 }
  let(:minor) { 2 }
  let(:patch) { 5 }
  let(:project_version) { [major, minor, patch].join('.') }
  let(:updated_version) { '1.2.6' }

  let(:file_handle) { OpenStruct.new(readline: "VERSION = '#{project_version}'", write: nil) }
  let(:version_file_tool) { RedButton::Utils::VersionFileTool.new(version_file_path) }

  describe 'parse_version' do
    before do
      expect(File).to receive(:open).with(version_file_path).and_yield(file_handle)
    end

    it 'reads the version from a file' do
      version = version_file_tool.parse_version

      expect(version[:major]).to be == major
      expect(version[:minor]).to be == minor
      expect(version[:patch]).to be == patch
    end
  end

  describe 'update' do
    before do
      expect(File).to receive(:open).with(version_file_path, 'w').and_yield(file_handle)
    end

    it 'writes out the new version into the version file' do
      expect(file_handle).to receive(:write).with("VERSION = '#{updated_version}'")
      version_file_tool.update_version(updated_version)
    end
  end

end
