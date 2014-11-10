require 'rails_helper'

RSpec.describe Article, :type => :model do

	let(:article) {FactoryGirl.build(:badarticle)}

	describe "is invalid without" do

		it "article title" do
			article.title = attributes_for(:badarticle)
			expect(article).to be_invalid
		end

		it "presense" do 
			article.title = attributes_for(:badarticle)
			expect(article).to be_invalid
		end
	end



end