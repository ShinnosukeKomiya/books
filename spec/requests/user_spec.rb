require 'rails_helper'

RSpec.describe "Book delete", type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:other_user) { FactoryBot.create(:user) }
  let(:book) { FactoryBot.create(:book) }

    # 他のアクションのテストは省略

    describe "#destroy" do
    # 認可されたユーザーとして
    context "as an authorized user" do
      # ユーザーを削除できること
      before do
        sign_in_as user
        FactoryBot.create(:book)
        redirect_to books_path
      end
      it "deletes a book" do
        expect {
          delete book_path(book), params: { id: book.id }
        }.to change(Book, :count).by(-1)
      end
    end

    # アカウントの違うユーザーの場合
    context "as au unauthorized user" do
      # ホーム画面にリダイレクトすること
      it "redirects to the dashboard" do
        sign_in_as other_user
        delete user_path(user), params: { id: user.id }
        expect(response).to redirect_to root_path
      end
    end

    # ゲストとして
    context "as a guest" do
      it "returns a 302 response" do
        delete user_path(user), params: { id: user.id }
        expect(response).to have_http_status "302"
      end

      it "redirects to the sign-in page" do
        delete user_path(user), params: { id: user.id }
        expect(response).to redirect_to login_path
      end
    end
  end
end
