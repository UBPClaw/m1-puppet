require 'spec_helper'
describe 'marketing' do

  context 'with default values for all parameters' do
    it { should contain_class('marketing') }
  end
end
