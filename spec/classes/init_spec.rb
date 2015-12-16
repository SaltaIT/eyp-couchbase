require 'spec_helper'
describe 'couchbase' do

  context 'with defaults for all parameters' do
    it { should contain_class('couchbase') }
  end
end
