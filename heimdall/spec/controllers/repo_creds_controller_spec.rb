require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.
#
# Also compared to earlier versions of this generator, there are no longer any
# expectations of assigns and templates rendered. These features have been
# removed from Rails core in Rails 5, but can be added back in via the
# `rails-controller-testing` gem.

RSpec.describe RepoCredsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # RepoCred. As you add validations to RepoCred, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    FactoryBot.build(:repo_cred).attributes
  }

  let(:invalid_attributes) {
    { username: nil, token: 'token2' }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # RepoCredsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  context 'Editor is logged in' do
    let(:user) { FactoryBot.create(:editor) }
    before do
      db_sign_in user
    end

    before(:each) do
      @repo = create :repo, created_by: user
    end

    describe 'POST #create' do
      context 'with valid params' do
        it 'creates a new RepoCred' do
          expect {
            post :create, params: { repo_id: @repo.id, repo_cred: valid_attributes }, session: valid_session
          }.to change { @repo.reload.repo_creds.count }.by(1)
        end

        it 'redirects to the created repo_cred' do
          post :create, params: { repo_id: @repo.id, repo_cred: valid_attributes }, session: valid_session
          expect(response).to redirect_to(@repo)
        end
      end

      context 'with invalid params' do
        it "returns a success response (i.e. to display the 'new' template)" do
          post :create, params: { repo_id: @repo.id, repo_cred: invalid_attributes }, session: valid_session
          expect(response).to_not be_success
        end
      end
    end

    describe 'PUT #update' do
      context 'with valid params' do
        let(:new_attributes) {
          { username: 'user2', token: 'token2' }
        }

        it 'updates the requested repo_cred' do
          repo_cred = @repo.repo_creds.create! valid_attributes
          name = repo_cred.username
          put :update, params: { repo_id: @repo.id, id: repo_cred.to_param, repo_cred: new_attributes }, session: valid_session
          repo_cred.reload
          expect(repo_cred.username).to_not eq(name)
        end

        it 'redirects to the repo_cred' do
          repo_cred = @repo.repo_creds.create! valid_attributes
          put :update, params: { repo_id: @repo.id, id: repo_cred.to_param, repo_cred: valid_attributes }, session: valid_session
          expect(response).to redirect_to(@repo)
        end
      end

      context 'with invalid params' do
        it "returns a success response (i.e. to display the 'edit' template)" do
          repo_cred = @repo.repo_creds.create! valid_attributes
          put :update, params: { repo_id: @repo.id, id: repo_cred.to_param, repo_cred: invalid_attributes }, session: valid_session
          expect(response).to_not be_success
        end
      end
    end

    describe 'DELETE #destroy' do
      it 'destroys the requested repo_cred' do
        repo_cred = @repo.repo_creds.create! valid_attributes
        expect {
          delete :destroy, params: { repo_id: @repo.id, id: repo_cred.to_param }, session: valid_session
        }.to change { @repo.reload.repo_creds.count }.by(-1)
      end

      it 'redirects to the repo_creds list' do
        repo_cred = @repo.repo_creds.create! valid_attributes
        delete :destroy, params: { repo_id: @repo.id, id: repo_cred.to_param }, session: valid_session
        expect(response).to redirect_to(@repo)
      end
    end
  end
end
