require 'rails_helper'



RSpec.describe PublishersController, type: :controller do

    let(:user) {Fabricate(:user)}
    before do
        sign_in :user , user
    end
    let(:valid_attributes) {
        Fabricate.attributes_for(:publisher)
    }

    let(:invalid_attributes) {
        Fabricate.attributes_for(:publisher, name: nil)
    }


    let(:valid_session) { {} }

    describe "GET #index" do
        it "assigns all publishers as @publishers" do
            publisher = Publisher.create! valid_attributes
            get :index, {}, valid_session
            expect(assigns(:publishers)).to eq([publisher])
        end
    end

    describe "GET #show" do
        it "assigns the requested publisher as @publisher" do
            publisher = Publisher.create! valid_attributes
            get :show, {:id => publisher.to_param}, valid_session
            expect(assigns(:publisher)).to eq(publisher)
        end
    end

    describe "GET #new" do
        it "assigns a new publisher as @publisher" do
            get :new, {}, valid_session
            expect(assigns(:publisher)).to be_a_new(Publisher)
        end
    end

    describe "GET #edit" do
        it "assigns the requested publisher as @publisher" do
            publisher = Publisher.create! valid_attributes
            get :edit, {:id => publisher.to_param}, valid_session
            expect(assigns(:publisher)).to eq(publisher)
        end
    end

    describe "POST #create" do
        context "with valid params" do
            it "creates a new Publisher" do
                expect {
                    post :create, {:publisher => valid_attributes}, valid_session
                }.to change(Publisher, :count).by(1)
            end

            it "assigns a newly created publisher as @publisher" do
                post :create, {:publisher => valid_attributes}, valid_session
                expect(assigns(:publisher)).to be_a(Publisher)
                expect(assigns(:publisher)).to be_persisted
            end

            it "redirects to the created publisher" do
                post :create, {:publisher => valid_attributes}, valid_session
                expect(response).to redirect_to(Publisher.last)
            end
        end

        context "with invalid params" do
            it "assigns a newly created but unsaved publisher as @publisher" do
                post :create, {:publisher => invalid_attributes}, valid_session
                expect(assigns(:publisher)).to be_a_new(Publisher)
            end

            it "re-renders the 'new' template" do
                post :create, {:publisher => invalid_attributes}, valid_session
                expect(response).to render_template("new")
            end
        end
    end

    describe "PUT #update" do
        context "with valid params" do
            let(:new_attributes) {
                Fabricate.attributes_for(:publisher , name:"test")
            }

            it "updates the requested publisher" do
                publisher = Publisher.create! valid_attributes
                put :update, {:id => publisher.to_param, :publisher => new_attributes}, valid_session
                publisher.reload
                expect(publisher.name).to eq("test")
            end

            it "assigns the requested publisher as @publisher" do
                publisher = Publisher.create! valid_attributes
                put :update, {:id => publisher.to_param, :publisher => valid_attributes}, valid_session
                expect(assigns(:publisher)).to eq(publisher)
            end

            it "redirects to the publisher" do
                publisher = Publisher.create! valid_attributes
                put :update, {:id => publisher.to_param, :publisher => valid_attributes}, valid_session
                expect(response).to redirect_to(publisher)
            end
        end

        context "with invalid params" do
            it "assigns the publisher as @publisher" do
                publisher = Publisher.create! valid_attributes
                put :update, {:id => publisher.to_param, :publisher => invalid_attributes}, valid_session
                expect(assigns(:publisher)).to eq(publisher)
            end

            it "re-renders the 'edit' template" do
                publisher = Publisher.create! valid_attributes
                put :update, {:id => publisher.to_param, :publisher => invalid_attributes}, valid_session
                expect(response).to render_template("edit")
            end
        end
    end

    describe "DELETE #destroy" do
        it "destroys the requested publisher" do
            publisher = Publisher.create! valid_attributes
            expect {
                delete :destroy, {:id => publisher.to_param}, valid_session
            }.to change(Publisher, :count).by(-1)
        end

        it "redirects to the publishers list" do
            publisher = Publisher.create! valid_attributes
            delete :destroy, {:id => publisher.to_param}, valid_session
            expect(response).to redirect_to(publishers_url)
        end
    end

end
