require 'rails_helper'

describe ChatsController, type: :controller do
  let(:user) { create(:user) }
  let(:group) { create(:group) }
  let(:chats) { create_list(:chat, 2, user: user, group: group )}

  describe 'GET #index' do
  	context 'user login' do
      before do
        login_user user
        get :index, params: { group_id: group }
      end

			  it "assigns the requested group to @group" do
			    expect(assigns(:group)).to eq group
			  end

			  it "assigns the requested group to @chats" do
			  	chats = group.chats
			    expect(assigns(:chats)).to eq chats
			  end

			  it "generate the requested group to @chat" do
			    expect(assigns(:chat)).to be_a_new Chat
		    end

			  it "renders the :index template" do
			    expect(response).to render_template :index
			  end
		end

		context 'user logout' do
	    it "redirect to new_user_session_path" do
	    	get :index, params: {group_id: group}
	      expect(response).to redirect_to new_user_session_path
	    end
	  end
	end

	describe 'POST #create'
	  context 'user login' do
	  	subject {post :create, params: { group_id: group, chat: attributes_for(:chat)}}
      before do
        login_user user
      end

			  it "can save a chat" do
			    expect {subject}.to change(Chat, :count).by(1)
			  end

			  it "Whether transition to the intended screen" do
			  	subject
			    expect(response).to redirect_to group_chats_path
			  end
		end

		context 'user login but dont save' do
			subject {post :create, params: {group_id: group, chat: attributes_for(:chat, text: nil, image: nil)}}
      before do
        login_user user
      end

			  it "Whether or not the message was saved" do
			    expect {subject}.to change(Chat, :count).by(0)
			  end

			  it "renders the :index template" do
			  	subject
			    expect(response).to render_template :index
			  end
		end

		context 'user logout' do
	    it "Whether transition to the intended screen" do
        post :create, params: { group_id: group }
        expect(response).to redirect_to new_user_session_path
	    end
	  end
end