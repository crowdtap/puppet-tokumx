require "spec_helper"

describe "tokumx" do
  let(:facts) { default_test_facts }

  it do
    should contain_class("tokumx::config")
    should contain_class("tokumx::package")
    should contain_class("tokumx::service")
  end
end
