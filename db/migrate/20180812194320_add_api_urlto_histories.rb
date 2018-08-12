class AddApiUrltoHistories < ActiveRecord::Migration[5.2]
  def change
    add_column :histories, :Api_Url, :string
  end
end
