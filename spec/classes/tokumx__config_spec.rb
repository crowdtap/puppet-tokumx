require "spec_helper"

describe "tokumx::config" do
  let(:facts) { default_test_facts }

  it do
    %w(config/tokumx data/tokumx log/tokumx).each do |d|
      should contain_file("/test/boxen/#{d}").with_ensure(:directory)
    end

    should contain_file("/test/boxen/config/tokumx/tokumx.conf")

    should contain_class("boxen::config")

    should contain_file("/test/boxen/env.d/tokumx.sh").with_ensure(:absent)
    should contain_file("/Library/LaunchDaemons/dev.tokumx.plist")
    should contain_boxen__env_script("tokumx")
  end

  context "Ubuntu" do
    let(:facts) { default_test_facts.merge(:operatingsystem => "Ubuntu") }

    it do
      %w(/etc/tokumx /data/db /var/log/tokumx).each do |d|
        should contain_file(d).with_ensure(:directory)
      end

      should contain_file("/etc/tokumx/tokumx.conf")

      should_not contain_class("boxen::config")

      should_not contain_file("/test/boxen/env.d/tokumx.sh").with_ensure(:absent)
      should_not contain_file("/Library/LaunchDaemons/dev.tokumx.plist")
      should_not contain_boxen__env_script("tokumx")
    end
  end
end
