require 'rails_helper'

describe 'タスク管理機能', type: :system do
  describe '一覧表示' do
    let(:user_a){FactoryBot.create(:user, name: 'ユーザーA', email: 'a@example.com')}
    let(:user_b){FactoryBot.create(:user, name: 'ユーザーB', email: 'b@example.com')}
    before do
      # 作成者がユーザーAのタスク作成
      FactoryBot.create(:task, name: '最初のタスク', user: user_a)
      # ログイン画面にアクセス
      visit login_path
      # 入力
      fill_in 'メールアドレス', with: login_user.email
      fill_in 'パスワード', with: login_user.password  # コード内では指定していないが、spec/factories/user.rbのデフォ値で指定しているので大丈夫。
      # ユーザーAでログインする
      click_button 'ログインする'
    end

    context 'ユーザーAがログイン中の場合' do
      let(:login_user){ user_a }

      it 'ユーザーAが作成したタスクが表示される' do
        expect(page).to have_content '最初のタスク'
      end
    end

    context 'ユーザーBがログイン中の場合' do
      let(:login_user){ user_b }

      it 'ユーザーAが作成したタスクが表示されない' do
        expect(page).to have_no_content '最初のタスク'
      end
    end

  end
end