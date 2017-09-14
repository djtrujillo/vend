class AddSnackMachineToSnacks < ActiveRecord::Migration[5.1]
  def change
    add_reference :snacks, :snack_machine, foreign_key: true
  end
end
