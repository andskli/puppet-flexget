require 'spec_helper'

describe 'flexget::init' do

  it { should contain_file('/var/lib/flexget') }
  it { should contain_file('/var/lib/flexget/config.yml') }
  it { should contain_user('flexget') }
  it { should contain_group('flexget') }

end