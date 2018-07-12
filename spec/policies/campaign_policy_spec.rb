# frozen_string_literal: true

describe CampaignPolicy do
  subject { CampaignPolicy }

  let (:current_user) { FactoryBot.build_stubbed :user, :novice }
  let (:expert_user) { FactoryBot.build_stubbed :user, :expert }
  let (:other_user) { FactoryBot.build_stubbed :user }

  permissions :index? do
    it 'allows access for a novice' do
      expect(subject).to permit(current_user)
    end
    it 'allows access for an expert' do
      expect(subject).to permit(expert_user)
    end
  end

  permissions :show? do
    it 'allows access for a novice' do
      expect(subject).to permit(current_user)
    end
    it 'allows access for an expert' do
      expect(subject).to permit(expert_user)
    end
  end

  permissions :update? do
    it 'prevents updates if not an expert' do
      expect(subject).not_to permit(current_user)
    end
    it 'allows an expert to make updates' do
      expect(subject).to permit(expert_user)
    end
  end

  permissions :destroy? do
    it 'allows an expert to delete any campaign' do
      campaign = FactoryBot.create :campaign
      expect(subject).to permit(expert_user, campaign)
    end
  end
end
