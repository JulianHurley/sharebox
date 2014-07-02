require 'rails_helper'

RSpec.describe SharedFolder, :type => :model do
	describe 'Associations' do

		it { should belong_to(:user).class_name('User') }
		it { should belong_to(:folder).class_name('Folder') }
		it { should belong_to(:shared_user).class_name('User') }
	end
end
