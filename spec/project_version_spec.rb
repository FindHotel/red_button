require 'rspec'
require 'spec_helper'

describe 'ProjectVersion' do
  describe '#bump!' do

    let(:major) { 1 }
    let(:minor) { 2 }
    let(:patch) { 5 }

    let(:original_version) { [major, minor, patch].join('.') }

    let(:project_version) { RedButton::Models::ProjectVersion.new(major, minor, patch) }

    context 'bumping up suffix segment' do
      context 'when it is a beta version' do
        let(:project_version_with_beta) { RedButton::Models::ProjectVersion.new(1, 2, 0, 'beta1') }

        it 'should increment the beta value, not the patch' do
          expect { project_version_with_beta.bump!('suffix') }.to change { project_version_with_beta.to_s }
                                                                      .from(project_version_with_beta.to_s)
                                                                      .to('1.2.0.beta2')
        end
      end
      context 'when it is a rc version' do
        let(:project_version_with_rc) { RedButton::Models::ProjectVersion.new(1, 2, 0, 'rc2') }

        it 'should increment the rc value, not the patch' do
          expect { project_version_with_rc.bump!('suffix') }.to change { project_version_with_rc.to_s }
                                                                    .from(project_version_with_rc.to_s)
                                                                    .to('1.2.0.rc3')
        end
      end
      context 'when it is neither beta or rc version' do
        it 'should increment the patch' do
          expect { project_version.bump!('suffix') }.to change { project_version.to_s }
                                                            .from(project_version.to_s)
                                                            .to('1.2.6')
        end
      end
    end

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
end
