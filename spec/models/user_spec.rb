require 'rails_helper'

RSpec.describe User, type: :model do
	describe 'Associations' do
		it { should have_many(:shared_folders).class_name('SharedFolder').dependent(:destroy) }
		it { should have_many(:being_shared_folders).class_name('SharedFolder').dependent(:destroy) }
		it { should have_many(:assets).class_name('Asset') }
		it { should have_many(:folders).class_name('Folder') }
	end
end
