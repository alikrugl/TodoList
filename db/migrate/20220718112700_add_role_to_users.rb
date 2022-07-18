# frozen_string_literal: true

# This class adds a column named role to the users table, and the column is an integer with a default value of 0.
class AddRoleToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :role, :integer, default: 0
  end
end
