require 'spec_helper'
describe 'mric' do

  context 'with default values for all parameters' do
    it { should contain_class('mric') }
  end
end
