require "spec_helper"

describe "tokumx::package" do
  let(:facts) { default_test_facts }

  it do
    should contain_homebrew__formula("tokumx")
    should contain_package("boxen/brews/tokumx")
  end

  context "Ubuntu" do
    let(:facts) { default_test_facts.merge(:operatingsystem => "Ubuntu") }

    it do
      should_not contain_homebrew__formula("tokumx")
      should contain_package("tokumx")
    end
  end
end
