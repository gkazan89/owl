class RemoveArticleIdFromHistories < ActiveRecord::Migration[5.2]
  def change
    remove_column :histories, :article_id, :integer
  end
end
