# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PeopleController, type: :controller do
  let(:valid_attributes) do
    {
      name: 'Test Person',
      birth: Date.new(2000, 1, 1),
      home: 'Test City',
      height: 170,
      office: 'Test Company'
    }
  end

  let(:invalid_attributes) do
    {
      name: nil,
      birth: Date.new(2000, 1, 1),
      home: 'Test City',
      height: 170,
      office: 'Test Company'
    }
  end

  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'returns a success response' do
      person = Person.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      person = Person.create! valid_attributes
      get :show, params: { id: person.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      person = Person.create! valid_attributes
      get :edit, params: { id: person.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Person' do
        expect {
          post :create, params: { person: valid_attributes }, session: valid_session
        }.to change(Person, :count).by(1)
      end

      it 'redirects to the created person' do
        post :create, params: { person: valid_attributes }, session: valid_session
        expect(response).to redirect_to(Person.last)
      end
    end

    context 'with invalid params' do
      it 'returns a success response (i.e. to display the "new" template)' do
        post :create, params: { person: invalid_attributes }, session: valid_session
        expect(response).to_not be_successful
      end
    end
  end

  describe 'PATCH #update' do
    context 'with valid params' do
      let(:new_attributes) do
        {
          name: 'Updated Name',
          home: 'Updated City'
        }
      end

      it 'updates the requested person' do
        person = Person.create! valid_attributes
        patch :update, params: { id: person.to_param, person: new_attributes }, session: valid_session
        person.reload
        expect(person.name).to eq(new_attributes[:name])
        expect(person.home).to eq(new_attributes[:home])
      end

      it 'redirects to the person' do
        person = Person.create! valid_attributes
        patch :update, params: { id: person.to_param, person: valid_attributes }, session: valid_session
        expect(response).to redirect_to(person)
      end
    end

    context 'with invalid params' do
      let(:invalid_params) { { person: { name: '', birth: '', home: '', height: '', office: '' } } }
  
      it 'does not save the new person' do
        expect {
          post :create, params: invalid_params
        }.to_not change(Person, :count)
      end
  
      it 're-renders the new method' do
        post :create, params: invalid_params
        expect(response).to render_template(:new)
      end
    end
  end
  
  describe "PATCH #update" do
    let!(:person) { create(:person) }
  
    context "with valid params" do
      it "updates the requested person" do
        valid_params = { person: { name: "new name" } }
        patch :update, params: valid_params.merge(id: person.id)
        person.reload
        expect(person.name).to eq("new name")
      end
  
      it "redirects to the person" do
        valid_params = { person: { name: "new name" } }
        patch :update, params: valid_params.merge(id: person.id)
        expect(response).to redirect_to(person)
      end
    end
  
    context "with invalid params" do
      let(:invalid_params) do
        { person: { name: "" } }
      end
  
      it "does not update the requested person" do
        patch :update, params: invalid_params.merge(id: person.id)
        person.reload
        expect(person.name).to_not eq("")
      end
  
      it "re-renders the edit method" do
        patch :update, params: invalid_params.merge(id: person.id)
        expect(response).to render_template(:edit)
      end
    end
  end
end


