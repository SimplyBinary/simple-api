require 'spec_helper'

describe TokenCreatorService do
	let(:user) { create(:user) }
	context "when authenticated" do
		it "returns a token" do
			token = TokenCreatorService.new(user, "password").run
			expect(token).to_not be_nil
		end
	end
end
		