class AddOvertimeRequestToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :overtime_request, :integer,default: 0.0
  end
end
