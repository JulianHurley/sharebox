require 'rails_helper'

RSpec.describe SharedFolder, :type => :model do
	describe 'Associations' do
		it { should belong_to :user }
		it { should belong_to :folder }
		it { should belong_to :shared_user }
	end
end
