

  describe "GET index" do
    it "assigns all posts as @posts" do
      post = Post.create! valid_attributes
      get :index, {}
      expect(assigns(:posts)).to eq([post])
    end
  end

  describe "GET show" do
    it "assigns the requested post as @post" do
      post = Post.create! valid_attributes
      get :show, params: {:id => post.to_param}
      expect(assigns(:post)).to eq(post)
    end
  end

  describe "GET new" do
    it "assigns a new post as @post" do
      get :new, {}
      expect(assigns(:post)).to be_a_new(Post)
    end
  end

  describe "GET edit" do
    it "assigns the requested post as @post" do
      post = Post.create! valid_attributes
      get :edit, params: {:id => post.to_param}
      expect(assigns(:post)).to eq(post)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Post" do
        expect {
          post :create, params: {:post => valid_attributes}
        }.to change(Post, :count).by(1)
      end

      it "assigns a newly created post as @post" do
        post :create, params: {:post => valid_attributes}
        expect(assigns(:post)).to be_a(Post)
        expect(assigns(:post)).to be_persisted
      end

      it "redirects to the created post" do
        post :create, params: {:post => valid_attributes}
        expect(response).to redirect_to(Post.last)
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        {title: "New String"}
      }

      it "updates the requested post" do
        post = Post.create! valid_attributes
        put :update, params: {:id => post.to_param, :post => new_attributes}
        post.reload
        expect(post.title).to eq("New String")
      end

      it "assigns the requested post as @post" do
        post = Post.create! valid_attributes
        put :update, params: {:id => post.to_param, :post => valid_attributes}
        expect(assigns(:post)).to eq(post)
      end

      it "redirects to the post" do
        post = Post.create! valid_attributes
        put :update, params: {:id => post.to_param, :post => valid_attributes}
        expect(response).to redirect_to(post)
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested post" do
      post = Post.create! valid_attributes
      expect {
        delete :destroy, params: {:id => post.to_param}
      }.to change(Post, :count).by(-1)
    end

    it "redirects to the posts list" do
      post = Post.create! valid_attributes
      delete :destroy, params: {:id => post.to_param}
      expect(response).to redirect_to(posts_url)
    end
  end

end
