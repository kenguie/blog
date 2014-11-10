FactoryGirl.define do
	
	factory :article do
		title "Great Article"
		text "Super way to write articles"

		factory :badarticle do
			title = nil	
		end
	end

end