require 'spec_helper'

describe 'flexget::install' do

	it { should contain_package('python-pip').with_ensure('present') }

end