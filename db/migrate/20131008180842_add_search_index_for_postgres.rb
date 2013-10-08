class AddSearchIndexForPostgres < ActiveRecord::Migration
  def change
    if Rails.env == "production"
      execute "CREATE INDEX coupons_name_gist_trgm_idx ON coupons USING gist (name gist_trgm_ops);"
      execute "CREATE INDEX coupons_description_gist_trgm_idx ON coupons USING gist (description gist_trgm_ops);"

      execute "CREATE INDEX merchants_name_gist_trgm_idx ON merchants USING gist (name gist_trgm_ops);"
      execute "CREATE INDEX merchants_description_gist_trgm_idx ON merchants USING gist (description gist_trgm_ops);"
    end
  end
end
