class CreateTestModels < ActiveRecord::Migration
  def change
    create_table :test_models do |t|
      string_fields = %w( search telephone date datetime datetime_local month week url email color time )
      #int_fields = %w( search telephone date datetime datetime_local month week url email color time )
      string_fields.each do |fld|
        t.string "my_#{fld}"
      end
      t.timestamps null: false
    end
  end
end



# number_field(:product, :price, in: 1.0..20.0, step: 0.5) %>
# range_field(:product, :discount, in: 1..100) %>
