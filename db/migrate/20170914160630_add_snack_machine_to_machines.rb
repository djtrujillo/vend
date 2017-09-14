class AddSnackMachineToMachines < ActiveRecord::Migration[5.1]
  def change
    add_reference :machines, :snack_machine, foreign_key: true
  end
end
