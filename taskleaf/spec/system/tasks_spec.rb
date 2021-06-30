require 'rails_helper'

RSpec.describe 'タスク管理機能', type: :system do

  let(:user_a){FactoryBot.create(:user, name: 'ユーザーA', email: 'a@example.com')}
  let(:user_b){FactoryBot.create(:user, name: 'ユーザーB', email: 'b@example.com')}
  let!(:task_a){FactoryBot.create(:task, name: '最初のタスク', user: user_a)}
  before do
    # ログイン画面にアクセス
    visit login_path
    # 入力
    fill_in 'メールアドレス', with: login_user.email
    fill_in 'パスワード', with: login_user.password  # コード内では指定していないが、spec/factories/user.rbのデフォ値で指定しているので大丈夫。
    # ユーザーAでログインする
    click_button 'ログインする'
  end

  shared_examples 'ユーザーAが作成したタスクが表示される' do
    it { expect(page).to have_content '最初のタスク' }
  end
  describe '一覧表示機能' do
    context 'ユーザーAがログイン中の場合' do
      let(:login_user){ user_a }

      it_behaves_like 'ユーザーAが作成したタスクが表示される'
    end

    context 'ユーザーBがログイン中の場合' do
      let(:login_user){ user_b }

      it 'ユーザーAが作成したタスクが表示されない' do
        expect(page).to have_no_content '最初のタスク'
      end
    end
  end

  describe '詳細表示機能' do
    before do
      visit task_path(task_a)
    end
    context 'ユーザーAがログイン中の場合' do
      let(:login_user){ user_a }

      it_behaves_like 'ユーザーAが作成したタスクが表示される'
    end
  end

  describe '新規登録機能' do
    let(:login_user){ user_a }
    before do
      visit new_task_path
      fill_in '名称', with: task_name
      click_button '登録する'
    end

    context 'タスクの名称を入力した場合' do
      let(:task_name){'2番目のタスク'}
      it '正常に登録できること' do
        # expect(page).to have_selector '.alert-success', text: '2番目のタスク'
        within '.alert-success' do
          expect(page).to have_content '2番目のタスク'
        end
      end
    end

    context 'タスクの名称を入力しない場合' do
      let(:task_name){''}
      it 'エラーになり登録できないこと' do
        expect(page).to have_selector '#error_explanation', text: '名称を入力してください'
        # within '#error_explanation' do
        #   expect(page).to have_content '名称を入力してください'
        # end
      end
    end
  end
end