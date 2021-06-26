class AddUserIdToTasks < ActiveRecord::Migration[5.2]
  def up
    # データが入っているので全消し
    execute 'DELETE FROM tasks;'
    # リファレンス＝参照追加
    add_reference :tasks, :user, null: false, index: true
  end
  def down
    remove_reference :tasks, :user, index: true
  end
end
