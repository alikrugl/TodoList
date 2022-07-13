# frozen_string_literal: true

# This class adds a reference to the users table in the todos table.
class AddUserToTodos < ActiveRecord::Migration[7.0]
  def change
    add_reference :todos, :user, null: false, foreign_key: true
  end
end
