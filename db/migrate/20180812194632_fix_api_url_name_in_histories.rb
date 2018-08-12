class FixApiUrlNameInHistories < ActiveRecord::Migration[5.2]
  def change
    rename_column :histories, :Api_Url, :api_url
  end
end
