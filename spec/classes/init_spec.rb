require 'spec_helper'

describe 'flexget' do

  it { should contain_file('flexget_vardir') }
  it { should contain_file('flexget_conf') }
  it { should contain_user('flexget') }
  it { should contain_group('flexget') }

end