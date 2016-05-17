require 'spec_helper'
describe 'msec' do

  context 'with default values for all parameters' do
    it { should contain_class('msec') }
  end
end
