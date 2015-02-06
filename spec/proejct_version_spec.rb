require 'rspec'
require 'spec_helper'

describe '#bump!' do

  let(:major) { 1 }
  let(:minor) { 2 }
  let(:patch) { 5 }

  let(:original_version) { [major, minor, patch].join('.') }

  let(:project_version) { ProjectVersion.new(major, minor, patch) }

  context 'bumping up patch segment' do
    it 'should bump up the specified segment' do
      expect { project_version.bump! }.to change { project_version.to_s }.from(original_version).to('1.2.6')
    end
  end
  context 'bumping up minor segment' do
    it 'should bump up the specified segment' do
      expect { project_version.bump!('minor') }.to change { project_version.to_s }.from(original_version).to('1.3.0')
    end
  end
  context 'bumping up major segment' do
    it 'should bump up the specified segment' do
      expect { project_version.bump!('major') }.to change { project_version.to_s }.from(original_version).to('2.0.0')
    end
  end
end