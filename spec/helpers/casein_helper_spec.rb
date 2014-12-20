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

  describe 'field helpers' do
    
    let(:helper) { TestActionViewClass.new }
    let(:obj) { TestModel.new }
    let(:opts) { {} }
    let(:builder) { ActionView::Helpers::FormBuilder.new :test_model, obj, helper, opts }

    describe "#casein_color_field" do
      it "returns the correct version info" do
        field = helper.casein_color_field(builder, obj, 'my_color') 
        expect(field).to have_css('.form-group .well .color_field input#test_model_my_color')
        expect(field).to have_css('.form-group label.control-label', "My Color")
      end
    end

    describe "#casein_telephone_field" do
      it "returns the correct version info" do
        field = helper.casein_telephone_field(builder, obj, 'my_telephone') 
        expect(field).to have_css('.form-group .well .telephone_field input#test_model_my_telephone')
        expect(field).to have_css('.form-group label.control-label', "My Telephone")
      end
    end

    describe "#casein_search_field" do
      it "returns the correct version info" do
        field = helper.casein_search_field(builder, obj, 'my_search') 
        expect(field).to have_css('.form-group .well .search_field input#test_model_my_search')
        expect(field).to have_css('.form-group label.control-label', "My Search")
      end
    end

  end
  
end
