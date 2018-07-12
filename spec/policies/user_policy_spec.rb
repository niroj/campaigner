# frozen_string_literal: true

describe UserPolicy do
  subject { UserPolicy }

  let (:current_user) { FactoryBot.build_stubbed :user }
  let (:other_user) { FactoryBot.build_stubbed :user }
  let (:expert) { FactoryBot.build_stubbed :user, :expert }

  permissions :index? do
    it 'denies access if not an expert' do
      expect(UserPolicy).not_to permit(current_user)
    end
    it 'allows access for an expert' do
      expect(UserPolicy).to permit(expert)
    end
  end

  permissions :show? do
    it 'prevents other users from seeing your profile' do
      expect(subject).not_to permit(current_user, other_user)
    end
    it 'allows you to see your own profile' do
      expect(subject).to permit(current_user, current_user)
    end
    it 'allows an expert to see any profile' do
      expect(subject).to permit(expert)
    end
  end

  permissions :update? do
    it 'prevents updates if not an expert' do
      expect(subject).not_to permit(current_user)
    end
    it 'allows an expert to make updates' do
      expect(subject).to permit(expert)
    end
  end

  permissions :destroy? do
    it 'prevents deleting yourself' do
      expect(subject).not_to permit(current_user, current_user)
    end
    it 'allows an expert to delete any user' do
      expect(subject).to permit(expert, other_user)
    end
  end
end
