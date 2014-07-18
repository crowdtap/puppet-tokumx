require "spec_helper"

describe "tokumx::service" do
  let(:facts) { default_test_facts }

  it do
    should contain_service("com.boxen.tokumx").with_ensure(:stopped)
    should contain_service("dev.tokumx").with_ensure(:running)
  end

  context "ensure absent" do
    let(:params) { { :ensure => 'absent' } }

    it do
      should contain_service("com.boxen.tokumx").with_ensure(:stopped)
      should contain_service("dev.tokumx").with_ensure(:stopped)
    end
  end

  context "Ubuntu" do
    let(:facts) { default_test_facts.merge(:operatingsystem => "Ubuntu") }

    it do
      should_not contain_service("com.boxen.tokumx")
      should contain_service("tokumx").with_ensure(:running)
    end
  end
end

