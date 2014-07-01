require 'rails_helper'

describe Folder, type: :model do
	let(:folder_one){ FactoryGirl.create(:folder) }
	let(:folder_two){ FactoryGirl.create(:folder, parent_id: folder_one.id) }
	let(:folder_three){ FactoryGirl.create(:folder, parent_id: folder_two.id) }
	let(:folder_four){ FactoryGirl.create(:folder, parent_id: folder_three.id) }

	describe 'Associations' do
		
	end

	describe '#parent?' do
		context 'when first folder' do
			subject { folder_one }
			its(:parent?){ should eq false }
		end	

		context 'when second folder' do
			subject { folder_two }
			its(:parent?){ should eq true }
		end

		context 'when third folder' do
			subject { folder_two }
			its(:parent?){ should eq true }
		end

		context 'when fourth folder' do
			subject { folder_four }
			its(:parent?){ should eq true }
		end	
	end

	describe '#pwd' do
		context 'when first folder' do
			subject { folder_one }
			its(:pwd){ should eq [folder_one.name] }
		end

		context 'when second folder' do
			subject { folder_two }
			its(:pwd){ should eq [folder_one.name, folder_two.name] }
		end

		context 'when third folder' do
			subject { folder_three }
			its(:pwd){ should eq [folder_one.name, folder_two.name, folder_three.name] }
		end

		context 'when fourth folder' do
			subject { folder_four }
			its(:pwd){ should eq [folder_one.name, folder_two.name, folder_three.name, folder_four.name] }
		end
	end
end
