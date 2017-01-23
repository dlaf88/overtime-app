class ChangeDefaultOvertimeRequestInPost < ActiveRecord::Migration[5.0]
  def change
  	change_column_default(:posts,:overtime_request,0.0)
  end
end
