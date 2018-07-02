class Dropsurveytable < ActiveRecord::Migration[5.0]
  def change
  	drop_table :surveys
  end
end
