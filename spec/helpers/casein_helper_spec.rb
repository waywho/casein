require 'spec_helper'
require 'rspec/rails'

require_relative "../../app/helpers/casein/casein_helper"

describe "Casein::CaseinHelper", type: :helper do

  before do
    allow(subject).to receive("link_to").and_return("LINK_TO")
  end
  
  describe '#casein_get_footer_string' do
    it "builds a form field" do
      expect(helper.casein_get_footer_string false).to include "Running on"
      expect(helper.casein_get_footer_string false).to have_link "Casein", href: 'http://www.github.com/russellquinn/casein'
    end
  end

  describe "#casein_get_version_info" do
    it "returns the correct version info" do
      expect(helper.casein_get_version_info)
    end
  end

  describe "#casein_get_short_version_string" do
    it "returns the correct version info" do
      expect(helper.casein_get_short_version_string).to eql 'v' + Casein::VERSION.split(".").first
    end
  end

  describe "#casein_get_full_version_string" do
    it "returns the correct version info" do
      expect(helper.casein_get_full_version_string).to eql "v" + Casein::VERSION
    end
  end

end
