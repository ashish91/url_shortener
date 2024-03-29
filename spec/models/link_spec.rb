require 'rails_helper'

RSpec.describe Link, type: :model do

  let(:user) { FactoryBot.build(:sample_user) }

  let(:github_home_link) { FactoryBot.build(:github_home_link) }
  let(:ror_discuss_forum) { FactoryBot.build(:ror_discuss_forum) }

  it "Fetches recent first links" do

  end

  context "Updates metadata after save" do

    it "for link with title and description" do
      expect(Metadata).to receive(:retrieve_from).and_call_original

      ror_discuss_forum.save
      ror_discuss_forum.reload

      expect(ror_discuss_forum.title).to eq('Ruby on Rails Discussions - Ruby on Rails Discussions')
      expect(ror_discuss_forum.description).to eq('Ruby on Rails Discussions')
    end

    it "for link without title and description" do
      expect(Metadata).to receive(:retrieve_from).and_call_original
      expect_any_instance_of(Metadata).to receive(:attributes).and_return({})

      github_home_link.save
      github_home_link.reload

      expect(github_home_link.title).to be_nil
      expect(github_home_link.description).to be_nil
    end

  end

end