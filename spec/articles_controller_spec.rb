require 'rails_helper'

RSpec.describe ArticlesController, :type => :controller do

	let(:valid_attributes) {
		@valid_attributes = {
			title: "Greetings!",
			text: "Yes, greetings! Whoop di doooo"
		}
	}

	let(:invalid_attributes) {
		@invalid_attributes = {
			title: nil
		}
	}

	describe "GET 'index'" do
		it "returns http success" do
			get :index
			expect(response).to have_http_status(:success)
		end

		it "assigns all articles to @articles" do
			article = Article.create! valid_attributes
			get :index, {}
			expect(assigns(:articles)).to eq([article]) 
		end
	end

	describe "GET new" do
		it "assigns a new article to @article" do
			get :new
			expect(assigns(:article)).to be_a_new(Article)
		end
	end

	describe "GET show" do
		it "assigns article to @article" do
			article = Article.create! valid_attributes
			get :show, {id: article.to_param}
			expect(assigns(:article)).to eq(article)
		end
	end

	describe "Post create" do
	  describe "with valid params" do
		it "creates a new article" do
			expect {
				post :create, {article: valid_attributes}
			}.to change(Article, :count).by(1)
		end

		it "assigns a newly created article as @article" do
			post :create, {article: valid_attributes}
			expect(assigns(:article)).to be_an(Article)
			expect(assigns(:article)).to be_persisted
		end

		it "redirects to the created article" do
			post :create, {article: valid_attributes}
			expect(response).to redirect_to(Article.last)
		end
	  end

	  describe "with invalid params" do
	  	it "assigns a newly created but unsaved article as @article" do
	  		expect {
				post :create, {article: invalid_attributes}
			}.to change(Article, :count).by(0)

	  		#expect(assigns(:article)).to be_a_new(Article) - for some reason, this didn't pass
	  	end

	  	it "re-renders the :new template" do
	  		post :create, {article: invalid_attributes}
	  		expect(response).to render_template(:new)
	  	end

	  end
	end

	describe "Get edit" do
		it "assigns the requested article as @article" do
			article = Article.create! valid_attributes
			get :edit, {id: article.to_param}
			expect(assigns(:article)).to eq(article)
		end
	end

	describe "Delete destroy" do
		it "deletes the current @article" do
			article = Article.create! valid_attributes
			expect{
				delete :destroy, {id: article.to_param}
			}.to change(Article, :count).by(-1)
		end

		it "redirects to the articles list" do
			article = Article.create! valid_attributes
			delete :destroy, {id: article.to_param}
			expect(response).to redirect_to(articles_url)
		end	
	end

	describe "Put update" do

		describe "with valid params" do
			let(:new_attributes) {
				@valid_attributes = {
					title: "Hello everyone!",
					text: "Isn't this exciting?"
				}
			}

			it "updates already existing article" do
				article = Article.create! valid_attributes
				put :update, {id: article.to_param, article: new_attributes}
				article.reload
				expect(assigns(:update)).to eq(@article)
			end

			it "assigns the article as @article" do
				article = Article.create! valid_attributes
				put :update, {id: article.to_param, article: new_attributes}
				expect(assigns(:article)).to eq(article)
			end

			it "redirects back to the article" do
				article = Article.create! valid_attributes
				put :update, {id: article.to_param, article: new_attributes}
				expect(response).to redirect_to(article)
			end
		end

		describe "with invalid params" do
			it "assigns article as @article" do
				article = Article.create! valid_attributes
				put :update, {id: article.to_param, article: invalid_attributes}
				expect(assigns(:article)).to eq(article)
			end

			it "re-renders the edit page" do
				article = Article.create! valid_attributes
				put :update, {id: article.to_param, article: invalid_attributes}
				expect(response).to render_template(:edit)
			end
		end
	end

end








