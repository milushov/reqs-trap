require 'rails_helper'

RSpec.describe TrapsController, :type => :controller do

  describe 'info' do
    it 'returns http success' do
      get :info
      expect(response).to have_http_status(:success)
      expect(response.body).to include('Trap Requests')
    end
  end

  describe 'create trap' do
    it 'with get method, returns http success' do
      trap = Trap.create(secure_id: 'super-id')
      get :create, trap_id: trap.secure_id
      expect(response).to have_http_status(:success)
    end

    it 'with post method, returns http success' do
      trap = Trap.create(secure_id: 'super-id')
      get :create, trap_id: trap.secure_id
      expect(response).to have_http_status(:success)
    end
  end

  describe 'index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

end
